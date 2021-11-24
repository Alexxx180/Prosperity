-- meta data

CALL drop_meta_type(4);
CALL drop_meta_type(5);
CALL drop_meta_type(6);

CALL add_meta_type(
    "Отношение дисциплины"
);

CALL add_meta_type(
    "Путь практической подготовки"
);

CALL add_meta_type(
    "Курс ДО"
);

-- levels

CALL add_level(
    "ознакомительный",
    "узнавание ранее изученных объектов, свойств"
);

CALL add_level(
    "репродуктивный",
    "выполнение деятельности по образцу, инструкции или под руководством"
);

CALL add_level(
    "продуктивный",
    "планирование и самостоятельное выполнение деятельности, решение проблемных задач"
);

-- work types

CALL add_work_type_ignore_increment(
    0,
    "Содержание"
);

CALL add_work_type(
    "Практические занятия"
);

CALL add_work_type(
    "Контрольная работа"
);

CALL add_work_type(
    "Самостоятельная работа"
);

CALL add_work_type(
    "Лабораторная работа"
);

CALL add_work_type(
    "Практическая подготовка"
);

CALL add_work_type(
    "Курсовая работа"
);


-- source types

CALL add_source_type(
    "Основная литература"
);

CALL add_source_type(
    "Дополнительная литература"
);

CALL add_source_type(
    "Программное обеспечение"
);

CALL add_source_type(
    "Базы данных, информационно-справочные и поисковые системы"
);


-- meta data

CALL add_meta_data(
	1,
	1,
	"Общеобязательному направлению"
);

CALL add_meta_data(
	1,
	2,
	"Курс практики 1"
);

CALL add_meta_data(
	1,
	3,
	"/1"
);

    
CALL add_meta_data(
	2,
	1,
	"Профессиональному направлению"
);

CALL add_meta_data(
	2,
	2,
	"Курс практики 2"
);

CALL add_meta_data(
	2,
	3,
	"/2"
);


CALL add_meta_data(
	3,
	1,
	"общему гуманитарному и социально-экономическому циклу дисциплин учебного плана специальности 15.02.14 Оснащение средствами автоматизации технологических процессов и производств по отраслям, устанавливающих базовые знания, умения и навыки, необходимые в будущей профессиональной деятельности выпускника."
);

CALL add_meta_data(
	3,
	2,
	"Курс практики 3"
);

CALL add_meta_data(
	3,
	3,
	"/3"
);


-- disciplines

-- discipline OGSE.01

CALL add_discipline_code(
    "ОГСЭ.01"
);

CALL add_discipline(
    1,
    "Основы философии"
);

CALL add_section(
    1,
    1,
    "Пример",
    21
);

-- SET max_sp_recursion_depth=255;
CALL add_theme(
    1,
    2,
    1,
    "Пример",
    11
);

CALL add_work(
    1,
    1
);

CALL add_task(
    1,
    "Прохождение основ",
    5
);

CALL add_task(
    1,
    "Изучение предмета",
    6
);

CALL add_theme(
    1,
    2,
    2,
    "Пример",
    10
);

CALL add_work(
    2,
    1
);

CALL add_task(
    2,
    "Обучение азам",
    5
);

CALL add_work(
    2,
    1
);

CALL add_task(
    3,
    "Кто есть Я?",
    5
);
                                
CALL add_source(
    1,
    1,
    "Пример источника"
);

CALL add_source(
    1,
    1,
    "Пример источника 2"
);

CALL add_source(
    1,
    1,
    "Пример источника 3"
);

CALL add_source(
    1,
    1,
    "Пример источника 4"
);


-- discipline OGSE.02

CALL add_discipline_code(
    "ОГСЭ.02"
);

CALL add_discipline(
    2,
    "Технология разработки и защиты баз данных"
);

CALL add_section(
    2,
    1,
    "Пример",
    12
);

CALL add_theme(
    2,
    2,
    1,
    "Пример",
    12
);

CALL add_work(
    3,
    1
);

CALL add_task(
    4,
    "Прохождение основ",
    12
);
                                
CALL add_source(
    2,
    1,
    "Пример источника 5"
);

CALL add_source(
    2,
    1,
    "Пример источника 6"
);

CALL add_source(
    2,
    1,
    "Пример источника 7"
);

CALL add_source(
    2,
    1,
    "Пример источника 8"
);


-- discipline OGSE.03

CALL add_discipline_code(
    "ОГСЭ.03"
);

CALL add_discipline(
    3,
    "Иностранный язык в профессиональной деятельности (английский язык)"
);



CALL add_section(
    3,
    1,
    "Из истории автоматизации. Historical Development of Automation",
    31
);

CALL add_theme(
    3,
    1,
    1,
    "Механизация. Mechanization.",
    10
);

CALL add_work(
    4,
    1
);

CALL add_task(
    5,
    "Введение.",
    3
);

CALL add_task(
    5,
    "Лексика по теме «Механизация».",
    3
);

CALL add_task(
    5,
    "Грамматика: активизация времен активного залога (времена групп Simple, Progressive, Perfect).",
    4
);

CALL add_theme(
    3,
    2,
    2,
    "Из истории роботов и гибких производственных систем. History of Robots and Flexible  Manufacturing Systems.",
    11
);

CALL add_work(
    5,
    1
);

CALL add_task(
    6,
    "Лексика по теме «Из истории роботов и гибких производственных систем».",
    5
);

CALL add_task(
    6,
    "Грамматика: активизация времен пассивного залога: времена групп  Simple, Progressive).",
    6
);

CALL add_theme(
    3,
    2,
    3,
    "Автоматизация и общество. Automation and Society.",
    11
);

CALL add_work(
    6,
    1
);

CALL add_task(
    7,
    "Лексика по теме «Автоматизация и общество».",
    5
);

CALL add_task(
    7,
    "Грамматика: времена пассивного залога (времена группы Perfect).",
    6
);


CALL add_section(
    3,
    2,
    "Основные понятия автоматизации. Main Definitions of Automation.",
    31
);

CALL add_theme(
    4,
    2,
    1,
    "Основные элементы автоматических систем. Basic Elements of Automation.",
    10
);

CALL add_work(
    7,
    1
);

CALL add_task(
    8,
    "Лексика по теме «Основные элементы автоматических систем».",
    5
);

CALL add_task(
    8,
    "Грамматика: Словообразование. Основные английские префиксы и суффиксы.",
    5
);

CALL add_theme(
    4,
    2,
    2,
    "Контроль обратной связи и вероятностный контроль. Feedback and Stochastic Control.",
    10
);

CALL add_work(
    8,
    1
);

CALL add_task(
    9,
    "Лексика по теме «Контроль обратной связи и вероятностный контроль».",
    5
);

CALL add_task(
    9,
    "Грамматика: словообразование существительных и глаголов.",
    5
);

CALL add_theme(
    4,
    2,
    3,
    "Типы автоматизации. Types of Automation.",
    11
);

CALL add_work(
    9,
    1
);

CALL add_task(
    10,
    "Лексика по теме «Типы автоматизации».",
    5
);

CALL add_task(
    10,
    "Грамматика: словообразование прилагательных и наречий.",
    6
);


CALL add_section(
    3,
    3,
    "Автоматическое оборудование. Automation Equipment.",
    45
);

CALL add_theme(
    5,
    2,
    1,
    "ЧПУ типа CNC. CNC Machines.",
    11
);

CALL add_work(
    10,
    1
);

CALL add_task(
    11,
    "Лексика по теме «ЧПУ типа CNC».",
    5
);

CALL add_task(
    11,
    "Грамматика: систематизация пройденного материала.",
    6
);

CALL add_theme(
    5,
    2,
    2,
    "Робототехника. Виды роботов. Robotics.Types of Robots.",
    20
);

CALL add_work(
    11,
    1
);

CALL add_task(
    12,
    "Лексика по теме «Робототехника. Виды роботов»",
    10
);

CALL add_task(
    12,
    "Грамматика: предлоги места, времени и направления.",
    10
);

CALL add_theme(
    5,
    2,
    3,
    "Автоматизированная сервисная система. Material Handling System.",
    7
);

CALL add_work(
    12,
    1
);

CALL add_task(
    13,
    "Лексика по теме «Автоматизированная сервисная система».",
    3
);

CALL add_task(
    13,
    "Грамматика: артикль.",
    4
);

CALL add_theme(
    5,
    2,
    4,
    "Автоматические производственные линии. Automated Production Lines.",
    7
);

CALL add_work(
    13,
    1
);

CALL add_task(
    14,
    "Лексика по теме: «Автоматические производственные линии».",
    3
);

CALL add_task(
    14,
    "Грамматика: активизация пройденного грамматического материала.",
    4
);


CALL add_section(
    3,
    4,
    "Гибкие производственные системы. Flexible Manufacturing Systems.",
    18
);

CALL add_theme(
    6,
    2,
    1,
    "Характерные особенности гибких производственных систем. Features of Flexible Manufacturing Systems.",
    6
);

CALL add_work(
    14,
    1
);

CALL add_task(
    15,
    "Лексика по теме «Характерные особенности гибких производственных систем».",
    3
);

CALL add_task(
    15,
    "Грамматика: прямая и косвенная речь.",
    3
);

CALL add_theme(
    6,
    2,
    2,
    "Гибкие элементы системы. Flexible Cells.",
    6
);

CALL add_work(
    15,
    1
);

CALL add_task(
    16,
    "Лексика по теме «Гибкие элементы систем».",
    3
);

CALL add_task(
    16,
    "Грамматика: прямая и косвенная речь. Согласование времен.",
    3
);

CALL add_theme(
    6,
    2,
    3,
    "Иерархический контроль. Hierarchial Control.",
    6
);

CALL add_work(
    16,
    1
);

CALL add_task(
    17,
    "Лексика по теме: «Иерархический контроль».",
    3
);

CALL add_task(
    17,
    "Грамматика: отработка грамматических конструкций.",
    3
);


CALL add_section(
    3,
    5,
    "Датчики. Sensing.",
    18
);

CALL add_theme(
    7,
    2,
    1,
    "Классификация датчиков. Classification of Sensors.",
    12
);

CALL add_work(
    17,
    1
);

CALL add_task(
    18,
    "Лексика по теме «Классификация датчиков».",
    6
);

CALL add_task(
    18,
    "Грамматика: модальные глаголы.",
    6
);

CALL add_theme(
    7,
    2,
    2,
    "Датчики приближения и скольжения. Proximity and Slip Sensors.",
    12
);

CALL add_work(
    18,
    1
);

CALL add_task(
    19,
    "Лексика по теме «Датчики приближения и скольжения».",
    6
);

CALL add_task(
    19,
    "Грамматика: модальные глаголы и их эквиваленты.",
    6
);


CALL add_section(
    3,
    6,
    "Машинное программирование. Machine Programming.",
    14
);

CALL add_theme(
    8,
    2,
    1,
    "Содержание программы. Content of the Program.",
    5
);

CALL add_work(
    19,
    1
);

CALL add_task(
    20,
    "Лексика по теме «Содержание программы».",
    2
);

CALL add_task(
    20,
    "Грамматика: условные предложения I, II, III  типа.",
    3
);

CALL add_theme(
    8,
    2,
    2,
    "Программирование на машинном уровне. Machine-Level Programming.",
    5
);

CALL add_work(
    20,
    1
);

CALL add_task(
    21,
    "Лексика по теме «Программирование на машинном уровне».",
    2
);

CALL add_task(
    21,
    "Грамматика: условные предложения. Сослагательное наклонение после I wish.",
    3
);

CALL add_theme(
    8,
    2,
    3,
    "Программирование на уровне задач. Task-Level Programming.",
    4
);

CALL add_work(
    21,
    1
);

CALL add_task(
    22,
    "Лексика по теме «Программирование на уровне задач».",
    2
);

CALL add_task(
    22,
    "Грамматика: неличные формы глагола. Инфинитив.",
    2
);


CALL add_section(
    3,
    7,
    "Приводы в автоматических системах. Actuators in Automatic Systems.",
    12
);

CALL add_theme(
    9,
    2,
    1,
    "Электроприводы. Electric Actuators.",
    4
);

CALL add_work(
    22,
    1
);

CALL add_task(
    23,
    "Лексика по теме «Электроприводы».",
    2
);

CALL add_task(
    23,
    "Грамматика: конструкции с инфинитивом: сложное дополнение, сложное подлежащее.",
    2
);

CALL add_theme(
    9,
    2,
    2,
    "Пневматические приводы (линейные и вращающиеся). Pneumatic Actuators (Linear and Rotary)",
    4
);

CALL add_work(
    23,
    1
);

CALL add_task(
    24,
    "Лексика по теме «Пневматические приводы (линейные и вращающиеся)»",
    2
);

CALL add_task(
    24,
    "Грамматика: неличные формы глагола. Причастие I, II.",
    2
);

CALL add_theme(
    9,
    2,
    3,
    "Программирование на уровне задач. Task-Level Programming.",
    4
);

CALL add_work(
    24,
    1
);

CALL add_task(
    25,
    "Лексика по теме «Программирование на уровне задач».",
    2
);

CALL add_task(
    25,
    "Грамматика: неличные формы глагола. Инфинитив.",
    2
);

CALL add_theme(
    9,
    2,
    4,
    "Приводы контура обратной связи. Feedback Loop Actuators.",
    4
);

CALL add_work(
    25,
    1
);

CALL add_task(
    26,
    "Лексика по теме «Приводы контура обратной связи».",
    1
);

CALL add_task(
    26,
    "Грамматика: неличные формы глагола. Герундий.",
    2
);

CALL add_work(
    25,
    2
);

CALL add_task(
    27,
    "«подготовка презентации по теме».",
    1
);

CALL add_source(
    3,
    1,
    "   Английский язык для изучающих автоматику (В1–В2) : учеб. пособие для СПО / М. Ю. Рачков. — 2-е изд., испр. и доп. — М. : Издательство Юрайт, 2019. — 196 с. — (Серия : Профессиональное образование)"
);

CALL add_source(
    3,
    1,
    "   Карпова, Т.А. English for Colleges = Английский язык для колледжей. Практикум + Приложение: тесты: учебно-практическое пособие / Карпова Т.А., Восковская А.С., Мельничук М.В. — Москва: КноРус, 2020. — 286 с. — (СПО). — ISBN 978-5-406-07527-2. — URL: https://book.ru/book/932751— Текст: электронный."
);

CALL add_source(
    3,
    1,
    "   Английский язык для технических направлений: учеб. пособие для СПО/ Н.Л. Байдикова, Е.С.Давиденко. - М: Издательство Юрайт, 2019. - 171 с. - (Серия: Профессиональное образование). - ISBN 978-5-534-10078-5 // [Электронная библиотечная система Юрайт] / - Режим доступа: http://www.biblio-online.ru/"
);

CALL add_source(
    3,
    1,
    "   Английский язык. Грамматика: учебник и практикум для СПО / В.А.Гуреев.-М.: Издательство Юрайт, 2019. - 294 с. - (Серия: Профессиональное образование). ISBN 978-5-534-10481-3//[Электронная библиотечная система Юрайт] - Режим доступа: http://www.biblio-online.ru/"
);

CALL add_source(
    3,
    1,
    "   Английский язык. Грамматика: Сборник упражнений / Ю.Б. Голицынский; [8-е. изд., испр.]. - Санкт-Петербург: КАРО, 2020. - 576 с."
);

CALL add_source(
    3,
    2,
    "   Грамматика английского языка. Grammar in levels elementary - pre-intermediate: учеб. пособие для СПО/ Л.В. Буренко, О.С. Тарасенко, Г.А. Краснощекова; под общ. ред. Г.А. Краснощековой. - М.: Издательство Юрайт, 2019. - 227с. - (Серия: Профессиональное образование). ISBN 978-5-9916-9261-8// Электронная библиотечная система Юрайт / http://www.biblio-online.ru/"
);

CALL add_source(
    3,
    3,
    "   Электронно-библиотечная система Znanium.com - Режим доступа: http://znanium.com"
);

CALL add_source(
    3,
    3,
    "   Электронно-библиотечная система Юрайт http://www.biblio-online.ru/ - Режим доступа: http://www.biblio-online.ru/"
);

CALL add_source(
    3,
    3,
    "   Сайт для изучающих английский язык, студентов, преподавателей и переводчиков - [Электронный ресурс] - Режим досутпа: http://study-english.info/"
);