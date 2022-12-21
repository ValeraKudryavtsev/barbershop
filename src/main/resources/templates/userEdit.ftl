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
                        <div class="header__username">admin</div>
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
                        Редактирование аккаунтов
                    </h2>
                </div>
            </section>
            <section class="container edit__wrp">
                <form class="edit__box" action="/user" method="post">
                    <input required class="booking__input" type="text" value="${user.username}" name="username" placeholder="Введите имя">
                    <#list roles as role>
                        <label class="checkbox__wrp"><input class="checkbox__input" type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label>
                    </#list>
                    <input type="hidden" value="${user.id}" name="userId">
                    <input type="hidden" value="${_csrf.token}" name="_csrf">
                    <button style="align-self: flex-start" class="sign-in__button" type="submit">Сохранить</button>
                </form>
                <form class="edit__box" action="/" method="post">
                    <input required type="hidden" value="${user.id}" name="userId">
                    <input type="hidden" value="${_csrf.token}" name="_csrf">
                    <button style="align-self: flex-start" class="sign-in__button" type="submit">Удалить</button>
                </form>
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