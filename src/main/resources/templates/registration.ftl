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
            <section class="registration">
                <h1 class="sign-in__title">
                    Регистрация
                </h1>
                <p class="sign-in__message">
                    ${message?if_exists}
                </p>
                <@l.login "/registration" true />
                <a class="sign-in__link sign-in__link-before" href="/login">
                    Вернуться для входа
                </a>
            </section>
        </main>
    </body>
</@c.page>