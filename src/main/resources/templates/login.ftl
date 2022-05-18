<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
    <body>
        <header class="header">
            <section class="container header__wrp">
                <img src="/img/another-logo.svg" alt="logo" class="header__logo">
            </section>
        </header>
        <main class="sign-in__wrp">
            <section class="sign-in">
                <h1 class="sign-in__title">
                    Вход в аккаунт
                </h1>
                <p class="sign-in__message">
                    ${message?if_exists}
                </p>
                <@l.login "/login" false />
                <a class="sign-in__link" href="/registration">
                    Нет аккаунта? Регистрация
                </a>
            </section>
        </main>
    </body>
</@c.page>