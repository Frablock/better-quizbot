CREATE TABLE questions (
    questionID INTEGER PRIMARY KEY AUTOINCREMENT,
    question TEXT
);

CREATE TABLE answers (
    answerID INTEGER PRIMARY KEY AUTOINCREMENT,
    questionID INTEGER,
    answer TEXT,
    is_correct BOOLEAN,
    FOREIGN KEY (questionID) REFERENCES questions(questionID)
);


-- Défault question
INSERT INTO questions (question) VALUES ('Qui sont les vrais ennemis?');

INSERT INTO answers (questionID, answer, is_correct)
VALUES
(1, 'Le capitalisme, Mr Bolloré', TRUE),
(1, 'Robespierre', FALSE),
(1, 'Les chatons', FALSE),
(1, 'Les pandas', FALSE);

INSERT INTO questions (question) VALUES ('Qui a dit : "Je suis en tête à gauche"');

INSERT INTO answers (questionID, answer, is_correct)
VALUES
(2, 'Jean-Luc Mélenchon', TRUE),
(2, 'Robespierre', FALSE),
(2, 'Raphael Glucksmann', FALSE),
(2, 'Charles de Gaulle', FALSE);

INSERT INTO questions (question) VALUES ('Quel dirigeant a mené la Révolution d''Octobre en 1917?');

INSERT INTO answers (questionID, answer, is_correct)
VALUES
(3, 'Vladimir Lénine', TRUE),
(3, 'Joseph Staline', FALSE),
(3, 'Léon Trotski', FALSE),
(3, 'Nikita Khrouchtchev', FALSE);

INSERT INTO questions (question) VALUES ('Quel président français a nationalisé de nombreuses industries durant la cinquième république?');

INSERT INTO answers (questionID, answer, is_correct)
VALUES
(4, 'Charles de Gaulle', TRUE),
(4, 'François Mitterrand', FALSE),
(4, 'Jacques Chirac', FALSE),
(4, 'François Hollande', FALSE),
(4, 'Emanuel Macron', FALSE),
(4, 'Nicolas Sarkozy', FALSE);

INSERT INTO questions (question) VALUES ('Qui a écrit "Le Capital"?');

INSERT INTO answers (questionID, answer, is_correct)
VALUES
(5, 'Karl Marx', TRUE),
(5, 'Friedrich Engels', FALSE),
(5, 'Vladimir Lénine', FALSE),
(5, 'Léon Trotsky', FALSE);

INSERT INTO questions (question) VALUES ('Qui a dit : "Le changement, c''est maintenant" ?');

INSERT INTO answers (questionID, answer, is_correct)
VALUES
(6, 'François Hollande', TRUE),
(6, 'Nicolas Sarkozy', FALSE),
(6, 'Emmanuel Macron', FALSE),
(6, 'Jean-Luc Mélenchon', FALSE);

INSERT INTO questions (question) VALUES ('Quelle phrase résume la stratégie économique du capitalisme ?');

INSERT INTO answers (questionID, answer, is_correct)
VALUES
(7, 'Privatiser les profits, socialiser les pertes', TRUE),
(7, 'Un pour tous, tous pour un', FALSE),
(7, 'Chacun pour soi et Dieu pour tous', FALSE),
(7, 'Tous égaux dans le marché libre', FALSE);

INSERT INTO questions (question) VALUES ('Quelle est la devise préférée des marxistes (Pas que sur Internet) ?');

INSERT INTO answers (questionID, answer, is_correct)
VALUES
(8, 'Prolétaires de tous les pays, unissez-vous !', TRUE),
(8, 'YOLO', FALSE),
(8, 'L''abus de capitalisme nuit gravement à la santé', FALSE),
(8, 'La dictature du prolétariat arrive en 5 minutes', FALSE);

INSERT INTO questions (question) VALUES ('Que réclament les syndicats lors des grèves ?');

INSERT INTO answers (questionID, answer, is_correct)
VALUES
(9, 'Des salaires décents', TRUE),
(9, 'Une piscine dans chaque bureau', FALSE),
(9, 'Des RTT illimités', FALSE),
(9, 'La privatisation des trottinettes électriques', FALSE);

INSERT INTO questions (question) VALUES ('Quel slogan pourrait être attribué à un gauchiste convaincu ?');

INSERT INTO answers (questionID, answer, is_correct)
VALUES
(10, 'Eat the rich', TRUE),
(10, 'Work hard, play harder', FALSE),
(10, 'Crypto for freedom', FALSE),
(10, 'Votez Macron, c''est le futur', FALSE);

INSERT INTO questions (question) VALUES ('Quel est le plus grand cauchemar d’un milliardaire?');

INSERT INTO answers (questionID, answer, is_correct)
VALUES
(11, 'Un impôt sur la fortune', TRUE),
(11, 'Une journée sans caviar', FALSE),
(11, 'Un yacht trop petit', FALSE),
(11, 'Un ordinateur en panne', FALSE);

INSERT INTO questions (question) VALUES ('Quel leader révolutionnaire est devenu un symbole sur les T-shirts ?');

INSERT INTO answers (questionID, answer, is_correct)
VALUES
(12, 'Che Guevara', TRUE),
(12, 'Lénine', FALSE),
(12, 'Staline', FALSE),
(12, 'Jean-Luc Mélenchon', FALSE);

INSERT INTO questions (question) VALUES ('Quel est le point commun entre le capitalisme et GNU/Linux ?');

INSERT INTO answers (questionID, answer, is_correct)
VALUES
(13, 'Ce sont des systèmes d''exploitation', TRUE),
(13, 'Ils sont tous utiles', FALSE),
(13, 'On peut `rm -rf` les données problématiques', FALSE),
(13, 'Les gauchistes ne les apprécies pas', FALSE);

INSERT INTO questions (question) VALUES ('Quel geste symbolise souvent la résistance chez les militants de gauche ?');

INSERT INTO answers (questionID, answer, is_correct)
VALUES
(14, 'Le poing levé', TRUE),
(14, 'Le pouce en l’air', FALSE),
(14, 'L’applaudissement', FALSE),
(14, 'La révérence', FALSE);

INSERT INTO questions (question) VALUES ('Quel groupe social est souvent défendu par les politiques de gauche ?');

INSERT INTO answers (questionID, answer, is_correct)
VALUES
(15, 'Les travailleurs', TRUE),
(15, 'Les milliardaires', FALSE),
(15, 'Les propriétaires de yachts', FALSE),
(15, 'Les influenceurs', FALSE);

INSERT INTO questions (question) VALUES ('Quel système économique est souvent présenté comme l’opposé du capitalisme ?');

INSERT INTO answers (questionID, answer, is_correct)
VALUES
(16, 'Le communisme', TRUE),
(16, 'Le libéralisme', FALSE),
(16, 'Le mercantilisme', FALSE),
(16, 'Le féodalisme', FALSE);

INSERT INTO questions (question) VALUES ('Quel personne de gauche a déclaré : "On ne résout pas les problèmes avec les modes de pensée qui les ont engendrés" ?');

INSERT INTO answers (questionID, answer, is_correct)
VALUES
(17, 'Albert Einstein', TRUE),
(17, 'Jean-Luc Mélenchon', FALSE),
(17, 'Karl Marx', FALSE),
(17, 'Noam Chomsky', FALSE);

