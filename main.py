from dotenv import dotenv_values

from interactions import Button, ButtonStyle
from interactions import SlashContext
from interactions import Client, Intents, listen, slash_command
from interactions.api.events import Component
#from interactions.api.http.http_client import ReactionRequests

import sqlite3
import random
import asyncio
from datetime import datetime, timezone, timedelta

TOKEN = dotenv_values(".env")["TOKEN"]

EMOTES = ("1️⃣", "2️⃣", "3️⃣", "4️⃣", "5️⃣", "6️⃣", "7️⃣", "8️⃣", "9️⃣", "🔟")

NUMBERS_OF_QUESTIONS = 2

waiting_time = 20

bot = Client(token=TOKEN, intents=Intents.DEFAULT)

con = sqlite3.connect("better-quizbot.db")

start_button = Button(
    style=ButtonStyle.PRIMARY,
    label="Commencer le quiz",
    custom_id="start_quiz",
    disabled=False
)

@listen()
async def on_ready():
    print("The bot is now running")
    print(f"This bot is owned by {bot.owner}")

@slash_command(name="create_button", description="Créer un bouton pour lancer un quiz")
async def create_button(ctx: SlashContext):
    await ctx.send("Création du bouton",ephemeral=True)

    await ctx.channel.send(components=start_button)

@listen(Component)
async def on_component(event: Component):
    ctx = event.ctx

    match ctx.custom_id:
        case "start_quiz":
            cur = con.cursor()
            cur.execute("SELECT * FROM questions")
            questions = cur.fetchall()

            message_id = ctx.channel.last_message_id
            message = ctx.channel.get_message(message_id)

            players_score = {}

            components = Button(
                style=ButtonStyle.PRIMARY,
                label="Répondez via les réactions ci-dessous",
                custom_id="start_quiz",
                disabled=True,
            )

            for _ in range(NUMBERS_OF_QUESTIONS):
                question = random.choice(questions)

                data = [
                    int(question[0])
                ]
                cur = con.cursor()
                cur.execute("SELECT answer, is_correct FROM answers WHERE questionID = ?", data)
                answers = cur.fetchall()

                answers = answers[:10:]
                random.shuffle(answers)
                answers_list = [EMOTES[i]+". "+answer[0] for i, answer in enumerate(answers)]

                now = datetime.now(timezone.utc)

                epoch = datetime(1970, 1, 1, tzinfo=timezone.utc)

                td = now - epoch + timedelta(seconds=waiting_time+1)

                timestamp = td.total_seconds()

                await message.edit(content="# "+question[1]+"\n\t"+"\n\t".join(answers_list)+"\nFin <t:"+str(timestamp).split(".")[0]+":R>", components=components)

                # Adding all reactions
                for i in range(len(answers_list)):
                    await message.add_reaction(emoji=EMOTES[i])

                await asyncio.sleep(waiting_time)

                reacts = message.reactions

                has_votes = []
                for i, answer in enumerate(answers):
                    users_reacts = await reacts[i].users(limit=0, after=None).fetch()
                    for user in users_reacts:
                        if user.id not in has_votes:
                            players_score[str(user.id)] = players_score.get(str(user.id), 0) + answer[1]
                            has_votes += str(user.id)

                # Deleting all reactions
                while (len(reacts)>0):
                    for i in reacts:
                        await i.remove()
                await asyncio.sleep(2)
            await message.edit(content=str(players_score),components=start_button)
bot.start()