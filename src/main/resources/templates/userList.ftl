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
                        <a class="header__link" href="/services">
                            <img class="header__link-archive" src="/img/archive.svg" alt="services">
                        </a>
                    </li>
                    <li class="header__item">
                        <a class="header__link" href="#">
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
                        Список аккаунтов
                    </h2>
                </div>
            </section>
            <section class="container table__wrp">
                <table>
                    <thead>
                        <tr class="table__row">
                            <th class="table__column-name">Name</th>
                            <th class="table__column-name">Role</th>
                            <th class="table__column-name"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <#list  users as user>
                            <tr class="table__row">
                                <td class="table__row-text">${user.username}</td>
                                <td class="table__row-text"><#list user.roles as role>${role}<#sep>, </#list></td>
                                <td class="table__row-text"><a class="table__link" href="/user/${user.id}">edit</a></td>
                            </tr>
                        </#list>
                    </tbody>
                </table>
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