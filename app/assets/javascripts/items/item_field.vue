<template>
  <section class="col-md-4">
    <div class="dress-info">
      <div class="dress-info__designer">{{ item.name }}</div>
      <div class="dress-info__name">{{ item.summary }}</div>
      <div class="dress-info__favorite">
        <i class="fa fa-heart-o"></i>
      </div>
      <div class="dress-info__price">
        <span class="dress-info__price__hire">
          HIRE {{ item.price.currency }}{{ item.price.hirePrice }}
        </span>
        <span class="dress-info__price__retail">
          HIRE {{ item.price.currency }}{{ item.price.retailPrice }}
        </span>
      </div>
      <div class="dress-info__label">
        <span class="label">FREE SHIPPING</span>
      </div>
    </div>
    <div class="dress-order order">
      <div class="order__label">1. SIZE</div>
      <div class="order__input where-size">
        <div class="order__input__option"></div>
        <div class="order__input__option"></div>
      </div>
      <a href="" class="order__guide">SIZE GUIDE</a>
      <div class="order__label">2. EVENT DATE</div>
      <input class="order__input where-event"></input>
      <div class="order__label">3. HIRE PERIOD</div>
      <div class="order__input where-period">
        <div class="order__input__option">4 Days</div>
        <div class="order__input__option">8 Days</div>
      </div>
      <div class="order__label">YOUR ORDER</div>
      <div class="order__info">
        <div class="order__info__designer">{{ item.name }}</div>
        <div class="order__info__name">{{ item.summary }}</div>
        <div class="order__info__size"></div>
        <div class="order__info__delivery">2017/06/27</div>
        <div class="order__info__return">2017/06/30</div>
      </div>
      <div class="order__submit">
        HIRE <i class="fa fa-angle-right"></i>
      </div>
    </div>
    <div class="dress-note">
      <ul class="note-list">
        <li class="note-list__item">
          <div class="note-list__item__title" data-toggle="collapse" data-target="#note1">
            STYLE NOTES <i class="fa fa-angle-right"></i>
          </div>
          <div class="collapse" id="note1">{{ item.description }}</div>
        </li>
        <li class="note-list__item">
          <div class="note-list__item__title" data-toggle="collapse" data-target="#note2">
            PRODUCT DETAILS <i class="fa fa-angle-right"></i>
          </div>
          <div class="note-list__item__content collapse" id="note2">{{ item.detail }}</div>
        </li>
        <li class="note-list__item">
          <div class="note-list__item__title" data-toggle="collapse" data-target="#note3">
            SIZE AND FIT <i class="fa fa-angle-right"></i>
          </div>
          <div class="note-list__item__content collapse" id="note3">
              BUST – Great for any cup size.
              WAIST – Fitted, dress with close fit.
              HIPS – Fitted, fits true to size (Go one size up for backup).
              LENGTH – Long.
              UNDERGARMENTS – Can be worn with any standard bra.
              FABRIC – Slightly-stretchy fabric. 
              GREAT FOR – Athletic, Hourglass, Tall, Straight & Narrow body (Model is 177cm/ 5’9” and is wearing an UK size 8).
          </div>
        </li>
        <li class="note-list__item">
          <div class="note-list__item__title" data-toggle="collapse" data-target="#note4">
            OUR FIT PROMISE <i class="fa fa-angle-right"></i>
          </div>
          <div class="note-list__item__content collapse" id="note4">{</div>
        </li>
      </ul>
    </div>
  </section>
</template>


<script>
  import itemField from './item_field';

  export default itemField;
</script>