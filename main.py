from dotenv import dotenv_values

from interactions import Button, ButtonStyle
from interactions import SlashContext
from interactions import Client, Intents, listen, slash_command
from interactions.api.events import Component

import sqlite3
import random
from datetime import datetime, timezone, timedelta

TOKEN = dotenv_values(".env")["TOKEN"]

EMOTES = ("1️⃣", "2️⃣", "3️⃣", "4️⃣", "5️⃣", "6️⃣", "7️⃣", "8️⃣", "9️⃣", "🔟")

NUMBERS_OF_QUESTIONS = 5

waiting_time = 20

bot = Client(token=TOKEN, intents=Intents.DEFAULT)

con = sqlite3.connect("better-quizbot.db")

@listen()
async def on_ready():
    print("The bot is now running")
    print(f"This bot is owned by {bot.owner}")

@slash_command(name="create_button", description="Créer un bouton pour lancer un quiz")
async def create_button(ctx: SlashContext):
    await ctx.send("Création du bouton",ephemeral=True)
    components = Button(
        style=ButtonStyle.PRIMARY,
        label="Commencer le quiz",
        custom_id="start_quiz",
    )

    await ctx.channel.send(components=components)

@listen(Component)
async def on_component(event: Component):
    ctx = event.ctx

    match ctx.custom_id:
        case "start_quiz":
            cur = con.cursor()
            cur.execute("SELECT * FROM questions")
            questions = cur.fetchall()

            for _ in range(NUMBERS_OF_QUESTIONS):
                question = random.choice(questions)

                data = [
                    int(question[0])
                ]
                cur = con.cursor()
                cur.execute("SELECT answer FROM answers WHERE questionID = ?", data)
                answers = cur.fetchall()

                components = Button(
                    style=ButtonStyle.PRIMARY,
                    label="Commencer le quiz",
                    custom_id="start_quiz",
                    disabled=True,
                )

                answers = answers[:10:]
                random.shuffle(answers)
                answers_list = [EMOTES[i]+". "+answer[0] for i, answer in enumerate(answers)]

                now = datetime.now(timezone.utc)

                epoch = datetime(1970, 1, 1, tzinfo=timezone.utc)

                td = now - epoch + timedelta(seconds=waiting_time+1)

                timestamp = td.total_seconds()

                await ctx.edit_origin(content="# "+question[1]+"\n\t"+"\n\t".join(answers_list)+"\n<t:"+str(timestamp).split(".")[0]+":R>", components=components)

                message_id = ctx.channel.last_message_id
                a = ctx.channel.get_message(message_id)
                for i in range(len(answers_list)):
                    await a.add_reaction(emoji=EMOTES[i])
                await asyncio.sleep(waiting_time)
bot.start()