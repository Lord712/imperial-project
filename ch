import requests
from bs4 import BeautifulSoup

# Получаем HTML-код страницы с олимпиадами
response = requests.get("https://olimpiada.ru/")
html = response.text

# Создаем объект BeautifulSoup для парсинга HTML
soup = BeautifulSoup(html, "html.parser")

# Получаем все элементы с информацией об олимпиадах
olympiads = soup.find_all("div", class_="fav_olimp olimpiada ")

# Создаем пустой список, в котором будем хранить данные об олимпиадах
olympiads_data = []

# Итерируемся по найденным элементам с олимпиадами
for olympiad in olympiads:
    # Получаем название олимпиады
    title = olympiad.find("span", class_="headline").text.strip()

    # Получаем сроки проведения олимпиады!!!!!!!!!!!!!!!!!
    dates = olympiad.find("span", class_="...").text.strip()

    # Получаем рейтинг олимпиады
    rating = olympiad.find("span", class_="pl_rating").text.strip()

    # Получаем доступные классы для участия в олимпиаде
    classes = olympiad.find("span", class_="classes_dop").text.strip()

    # Добавляем полученные данные об олимпиаде в список
    olympiads_data.append(
        {"Название олимпиады": title, "Сроки проведения": dates, "Рейтинг": rating, "Классы": classes})

# Выводим результаты в формате markdown
print("Список школьных олимпиад\n")

for olympiad_data in olympiads_data:
    print(f"- Название олимпиады: {olympiad_data['Название олимпиады']}\n")
    print(f"- Сроки проведения: {olympiad_data['Сроки проведения']}\n")
    print(f"- Рейтинг: {olympiad_data['Рейтинг']}\n")
    print(f"- Классы: {olympiad_data['Классы']}\n")
