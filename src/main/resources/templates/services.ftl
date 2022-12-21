<#include "parts/security.ftl">
<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
    <body class="body__wrp">
        <header class="header header__flex">
            <section class="container header__wrp">
                <div class="header__logo-box">
                    <a href="/">
                        <img src="/img/another-logo.svg" alt="logo" class="header__logo">
                    </a>
                </div>
                <ul class="header__list">
                    <li class="header__item">
                        <a class="header__link" href="/notes">
                            <img class="header__link-calendar" src="/img/calendar.svg" alt="book now">
                        </a>
                    </li>
                    <li class="header__item">
                        <a class="header__link" href="#">
                            <img class="header__link-archive" src="/img/archive.svg" alt="services">
                        </a>
                    </li>
                    <li class="header__item">
                        <a class="header__link" href="/user">
                            <img class="header__link-archive" src="/img/file-earmark-person.svg" alt="users">
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
        <main class="main__flex">
            <section class="banner">
                <div class="container banner__wrp">
                    <h2 class="banner__title">
                        Предоставляемые услуги
                    </h2>
                </div>
            </section>
            <section class="services__wrp container">
                <div class="services__form-box">
                    <form class="services__form" method="post">
                        <input required class="services__input" type="text" name="text" placeholder="Введите сообщение">
                        <input required class="services__input" type="text" name="price" placeholder="Введите цену">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <button class="services__button" type="submit">Добавить</button>
                    </form>
                </div>
                <#list messages as message>
                    <div class="messages__wrp">
                        <p class="messages__text">${message.text}</p>
                        <div style="display:flex; align-items: center">
                            <p class="messages__text messages__price">${message.price}<span>&#x20bd;</span></p>
                            <form class="edit__box" action="/services/delete" method="post">
                                <input required type="hidden" value="${message.id}" name="messageId">
                                <input type="hidden" value="${_csrf.token}" name="_csrf">
                                <button style="align-self: flex-start" class="sign-in__button" type="submit">Удалить</button>
                            </form>
                        </div>
                    </div>
                <#else>
                    <p class="messages__text">Нет услуг</p>
                </#list>
            </section>
        </main>
        <footer class="footer footer__flex">
            <div class="container footer__wrp">
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