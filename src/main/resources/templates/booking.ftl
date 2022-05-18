<#include "parts/security.ftl">
<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
    <body>
        <header class="header">
            <section class="container header__wrp">
                <div class="header__logo-box">
                    <a href="/">
                        <img src="/img/another-logo.svg" alt="logo" class="header__logo">
                    </a>
                </div>
                <ul class="header__list">
                    <li class="header__item">
                        <a class="header__link" href="#">
                            <img class="header__link-calendar" src="/img/calendar.svg" alt="book now">
                        </a>
                    </li>
                    <li class="header__item">
                        <div class="header__bar">
                        </div>
                    </li>
                    <li class="header__item">
                        <div class="header__username">${name}</div>
                    </li>
                    <li class="header__item">
                        <@l.logout />
                    </li>
                </ul>
            </section>
        </header>
        <main>
            <section class="banner">
                <div class="container banner__wrp">
                    <h1 class="banner__title">
                        Запись на стрижку
                    </h1>
                </div>
            </section>
            <section class="booking container">
                <form class="booking__form" method="post">
                    <div class="booking__form-box">
                        <div class="booking__input-box">
                            <h2 class="booking__input-title">Укажите данные для записи</h2>
                            <input required class="booking__input" type="text" name="name" placeholder="Введите имя">
                            <input required class="booking__input" type="email" name="email" placeholder="Введите email" value="${user.getEmail()}">
                            <input required class="booking__input" type="date" name="date" placeholder="Введите дату">
                            <input required class="booking__input" type="time" name="time" placeholder="Введите время">
                            <input  class="booking__input" type="text" name="comment" placeholder="Оствьте комментарий">
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                        </div>
                        <div class="booking__checkbox-box">
                            <h2 class="booking__checkbox-title">Перечень оказываемых услуг</h2>
                            <#list messages as message>
                                <div class="booking__label">
                                    <p class="messages__text">${message.text}</p>
                                    <p class="messages__text messages__price">${message.price}<span>&#x20bd;</span></p>
                                </div>
                            <#else>
                                <p class="messages__text">Нет услуг</p>
                            </#list>
                        </div>
                    </div>
                    <div class="booking__button-box">
                        <button class="booking__button" type="submit">
                            Записаться
                        </button>
                    </div>
                </form>
            </section>
            <section class="promo">
                <div class="container promo__wrp">
                    <article class="promo__article">
                        <h3 class="promo__title">Хочешь скидку?</h3>
                        <p class="promo__text">
                            Оставь свой email, мы отправим промокод на скидку 10% на первую стрижку
                        </p>
                    </article>
                    <div class="promo__form-wrp">
                        <form class="promo__form" action="promo" method="post">
                            <input required class="promo__input" type="email" name="promo" value="${user.getEmail()}" placeholder="Введите email">
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                            <button class="promo__button" type="submit">
                                Получить
                            </button>
                        </form>
                    </div>
                </div>
            </section>
        </main>
        <footer class="footer">
            <div class="container footer__wrp">
                <section class="footer__phone-box">
                    <p class="footer__phone">8 800 555 35 35</p>
                    <p class="footer__phone-text">Телефон администратора</p>
                </section>
                <section class="footer__logo-box">
                    <a href="/">
                        <img src="/img/another-logo.svg" alt="logo" class="footer__logo">
                    </a>
                </section>
                <section class="contacts">
                    <ul class="contacts__list">
                        <li class="contacts__item">
                            <a href="https://www.instagram.com/valera_kudryavtsev/" target="_blank"><img src="/img/insta.png" height="30px"></a>
                        </li>
                        <li class="contacts__item">
                            <a href="https://vk.com/valera_kudryavtsev" target="_blank"><img src="/img/vk.png" height="30px"></a>
                        </li>
                        <li class="contacts__item">
                            <a href="https://t.me/valera_kudryavtsev" target="_blank"><img src="/img/telegram.png" height="30px"></a>
                        </li>
                    </ul>
                </section>
            </div>
        </footer>
    </body>
</@c.page>