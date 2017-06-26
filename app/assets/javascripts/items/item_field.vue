<template>
  <div class="row">
    <section class="col-md-2 hide-sm">
      <ul class="dress-thumbnails">
        <li class="dress-thumbnails__thumbnail" v-for="image in item.images">
          <img :src="image.url" alt="" @click="toggleSlide(image)">
        </li>
      </ul>
    </section>

    <section class="col-md-4 col-xs-12 hide-lg">
      <div class="dress-info on-mobile">
        <div class="dress-info__designer">{{ item.designer.name }}</div>
        <div class="dress-info__name">{{ item.name }}</div>
        <div class="dress-info__favorite">
          <favorite :itemId="item.id"/>
        </div>
      </div>
    </section>
    <section class="col-md-6 col-xs-12">
      <div class="carousel">
        <div class="carousel__nav" @click="slideRight = !slideRight"><i class="fa fa-angle-left"></i></div>
        <div class="carousel__body">
          <ul class="carousel__images" :class="{slideRight: slideRight}">
            <li class="carousel__image" v-for="image in item.images">
              <img :src="image.url" alt="item.name">
            </li>
          </ul>
        </div>
        <div class="carousel__nav" @click="slideRight = !slideRight"><i class="fa fa-angle-right"></i></div>
      </div>
    </section>
    <section class="col-md-4 col-xs-12">
      <div class="dress-info">
        <div class="dress-info__designer hide-sm">{{ item.designer.name }}</div>
        <div class="dress-info__name hide-sm">{{ item.name }}</div>
        <div class="dress-info__favorite hide-sm">
          <favorite :itemId="item.id"/>
        </div>
        <div class="dress-info__price hide-sm">
          <span class="dress-info__price__hire">
            HIRE £{{ item.price.hirePrice }}
          </span>
          <span class="dress-info__price__retail">
            RETAIl £{{ item.price.retailPrice }}
          </span>
        </div>
        <div class="dress-info__price hide-lg">
          <span class="dress-info__price__hire">
            Rental £{{ item.price.hirePrice }}
          </span>
          <span class="dress-info__price__retail">
            Retail £{{ item.price.retailPrice }}
          </span>
        </div>
        <div class="dress-info__label">
          <span class="label">FREE SHIPPING</span>
        </div>
      </div>
      <div class="dress-order order">
        <div class="order__label">1. SIZE</div>
        <div class="order__size">
          <select class="order__input where-size" v-model="primaryUnitId">
            <option value="null">Select your option</option>
            <option class="order__input__option" :value="unit.id" v-for="unit in item.units">{{ unit.size }} {{ unit.length }}</option>
          </select>
        </div>
        <div class="order__size" v-if="!selectSecondary">
          <span>Need Free Backup Size?</span>
          <i class="fa fa-plus-circle" @click="selectSecondary = true"></i>
        </div>
        <transition name="selectSecondary">
          <div class="order__size" v-if="selectSecondary">
            <select class="order__input where-size" v-model="secondaryUnitId">
              <option value="null">Select your option</option>
              <option class="order__input__option" :value="unit.id" v-for="unit in item.units">{{ unit.size }} {{ unit.length }}</option>
            </select>
          </div>
        </transition>
        <a href="" class="order__guide where-size">SIZE GUIDE</a>
        <div class="order__label">2. HIRE PERIOD</div>
        <div class="order__input where-period">
          <div class="order__input__option" @click="order.period = 4" :class="{isSelected: order.period == 4}">4 Days</div>
          <div class="order__input__option" @click="order.period = 8" :class="{isSelected: order.period == 8}">8 Days</div>
        </div>
        <div class="order__label">3. SELECT YOUR EVENT DATE</div>
        <datePicker :period="order.period"/>
        <div class="order__guide where-date">
          the <span /> delivery date<br>the <span /> return date
        </div>
        <div class="order__label">YOUR ORDER</div>
        <div class="order__info">
          <div class="order__info__designer"> Designer: {{ item.designer.name }}</div>
          <div class="order__info__name">Dress: {{ item.name }}</div>
          <div class="order__info__size">Primary Size: {{ primaryUnit.size }} {{ primaryUnit.length }}</div>
          <div class="order__info__size" v-if="secondarySize">Backup Size: {{ secondaryUnit.size }} {{ secondaryUnit.length }}</div>
          <div class="order__info__period">Rental Days: {{ order.period }} days</div>
          <div class="order__info__event">Event Date : {{ order.eventDate }}</div>
          <div class="order__info__delivery">Delivery Date : {{ order.deliveryDate }}</div>
          <div class="order__info__return">Return Date : {{ order.returnDate }}</div>
        </div>
        <div class="order__submit" @click="addToCart()" v-if="isCartEmpty">
          ADD TO CART <i class="fa fa-angle-right"></i>
        </div>
        <div class="order__submit" @click="addToCart()" v-if="!isCartEmpty">
          SWAP DRESSES <i class="fa fa-angle-right"></i>
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
  </div>
</template>


<script>
  import itemField from './item_field';

  export default itemField;
</script>
