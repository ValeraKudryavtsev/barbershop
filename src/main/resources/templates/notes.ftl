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
                        <a class="header__link" href="#">
                            <img class="header__link-calendar" src="/img/calendar.svg" alt="book now">
                        </a>
                    </li>
                    <li class="header__item">
                        <a class="header__link" href="/services">
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
                        Записи на стрижку
                    </h2>
                </div>
            </section>
            <section class="container notes__box">
                <#list services as servise>
                    <div class="notes__wrp-box">
                        <div class="notes__wrp">
                            <p class="notes__text">Имя клиента: <span class="notes__subtext">${servise.name}</span></p>
                            <p class="notes__text">Email клиента: <span class="notes__subtext">${servise.email}</span></p>
                            <p class="notes__text">Дата записи: <span class="notes__subtext">${servise.date}</span></p>
                            <p class="notes__text">Время записи: <span class="notes__subtext">${servise.time}</span></p>
                            <p class="notes__text"><span class="notes__subtext">${servise.comment?if_exists}</span></p>
                        </div>
                    </div>
                <#else>
                    <p class="notes__text">Нет записей</p>
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