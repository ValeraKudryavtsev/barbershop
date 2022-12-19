<#macro login path isRegisterForm>
    <form class="sign-in__form" action="${path}" method="post">
        <input required class="sign-in__input" type="text" name="username" placeholder="Введите логин"/>
        <input id="password" required class="sign-in__input" type="password" name="password" placeholder="Введите пароль"/>
        <#if isRegisterForm>
            <input required class="sign-in__input" type="email" name="email" placeholder="Введите email"/>
            <p class="registration__text">
                После регистрации вам на почту будет отправлена ссылка для активации аккаунта
            </p>
        </#if>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button class="sign-in__button" type="submit" value="Sign In">Sign In</button>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit" value="Sign Out" class="header__button">
            <img class="header__link-exit" src="/img/box-arrow-in-left.svg" alt="exit">
        </button>
    </form>
</#macro>