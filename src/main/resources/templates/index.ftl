<#include "parts/security.ftl">
<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
    <body>
        <header class="header">
            <section class="container header__wrp">
                <div class="header__logo-box">
                    <a href="#">
                        <img src="/img/another-logo.svg" alt="logo" class="header__logo">
                    </a>
                </div>
                <ul class="header__list">
                    <#if !isAdmin>
                        <li class="header__item">
                            <a class="header__link" href="/booking">
                                <img class="header__link-calendar" src="/img/calendar.svg" alt="book now">
                            </a>
                        </li>
                    </#if>
                    <#if isAdmin>
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
                    </#if>
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
            <section class="barber">
                <div class="container barber__wrp">
                    <div class="barber__img-box">
                        <img class="barber__img" src="/img/barber.png" alt="barber-img">
                    </div>
                    <article class="barber__article">
                        <h1 class="barber__title">О нашем барбершопе</h1>
                        <p class="barber__text">
                            У нас есть всё, что требуется настоящему мужчине: атмосфера брутальности и мужского духа, профессионализм барберов и сохранение европейских традиций барберинга, а также отличный кофе и хорошая компания
                        </p>
                        <p class="barber__subtext">
                            Barbershop — намного больше, чем просто мужская парикмахерская. Это место, где Вам помогут найти свой собственный, неповторимый стиль. Стоит довериться мастерам OldBoy один раз, и, поверьте, новый образ не оставит Вас равнодушным. Мужские стрижки и опасное
                            бритье — это наш профиль, и мы уверены, что наши барберы делают это лучше всех. Как сказал однажды знаменитый Ральф Лорен: «Какой бы Вы образ жизни ни вели, у вас должен быть свой собственный стиль, свой собственный мир».
                        </p>
                    </article>
                </div>
            </section>
            <section class="catalog container">
                <div class="catalog__box">
                    <h2 class="catalog__heading">
                        Услуги барбершопа
                    </h2>
                    <p class="catalog__text">
                        стрижем и бреем
                    </p>
                </div>
                <ul class="catalog__list">
                    <li class="catalog__item catalog__item-1">
                        <p class="catalog__title">мужские<span class="catalog__subtitle">стрижки</span></p>
                    </li>
                    <li class="catalog__item catalog__item-2">
                        <p class="catalog__title">стрижка усов<span class="catalog__subtitle">и бороды</span></p>
                    </li>
                    <li class="catalog__item catalog__item-3">
                        <p class="catalog__title">бритье<span class="catalog__subtitle">бороды и головы</span></p>
                    </li>
                    <li class="catalog__item catalog__item-4">
                        <p class="catalog__title">нанесение<span class="catalog__subtitle">татуировок</span></p>
                    </li>
                </ul>
            </section>
            <section class="advantages">
                <div class="container advantages__wrp">
                    <h2 class="visually-hidden">Наши плюсы</h2>
                    <ul class="advantages__list">
                        <li class="advantages__item">
                            <img class="advantages__icon" src="/img/coffee-cup.svg" alt="coffee-cup">
                            <p class="advantages__text">вам обязательно предложат чашечку ароматного кофе или чая</p>
                        </li>
                        <li class="advantages__item">
                            <img class="advantages__icon" src="/img/medal.svg" alt="medal">
                            <p class="advantages__text">мы пострижем и побреем вас на высшем уровне по всем европейским традициям</p>
                        </li>
                        <li class="advantages__item">
                            <img class="advantages__icon" src="/img/best-friend.svg" alt="best-friend">
                            <p class="advantages__text">вы не успеете заметить, как снова захотите вернуться в наш барбершоп</p>
                        </li>
                    </ul>
                </div>
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
                        <form class="promo__form" method="post">
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
                    <a href="#">
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