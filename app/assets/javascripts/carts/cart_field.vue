<template>
  <div class="container">
    <div class="row">
      <div class="col-md-8 cart-title">SHOPPING BAG</div>
      <div class="col-md-4 cart-timer">Only {{ calcTime }} minutes left</div>
      <div class="col-md-8 cart">
        <div class="cart__header">Rental Period: May 04, 2017 - Free return on May 08, 2017</div>
        <div class="cart__body">
          <div class="row cart-item" v-for="item in cart.items">
            <div class="col-md-3 cart-item__image">
              <img :src="item.images[0].url" alt="">
            </div>
            <div class="col-md-3 cart-item__info">
              <div class="cart-item__designer">{{ item.designer }}</div>
              <div class="cart-item__name">{{ item.name }}</div>
              <div class="cart-item__remove">Remove</div>
            </div>
            <table class="col-md-6 cart-item__status">
              <thead>
                <tr>
                  <th>SIZE</th>
                  <th>PRICE</th>
                  <th>INSURANCE</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="unit in item.units">
                  <td>{{ unit.size }} {{ unit.length }}</td>
                  <td v-if="unit.priority == 0">£{{ unit.price }}</td>
                  <td v-if="unit.priority != 0" class="color-red is-bold">FREE</td>
                  <td v-if="unit.priority == 0">£4.90</td>
                  <td v-if="unit.priority != 0" class="color-red is-bold">FREE</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <div class="col-md-4 row">
        <div class="col-md-12 cart-price">
          <div class="cart-price__header">ORDER SUMMARY</div>
          <div class="cart-price__body">
            <ul class="price-list">
              <li class="price-list__item">
                <div class="price-list__label">Subtotal</div>
                <div class="pricelist__price">£235</div>
              </li>
              <li class="price-list__item">
                <div class="price-list__label">Shipping & Handling</div>
                <div class="pricelist__price">£9.90</div>
              </li>
              <li class="price-list__item">
                <div class="price-list__label">Insurance</div>
                <div class="pricelist__price">£4.90</div>
              </li>
              <li class="price-list__item">
                <div class="price-list__label">Return via DHL</div>
                <div class="pricelist__price">FREE</div>
              </li>
              <li class="price-list__item">
                <div class="price-list__label">Welcome gift</div>
                <div class="pricelist__price">- £15.00</div>
              </li>
            </ul>
            <div class="promo-code">
              <div class="promo-code__header" @click="addCode = !addCode" :class="{active: addCode}"> Add promo code <i class="fa fa-angle-right"></i></div>
              <div class="promo-code__body" :class="{active: addCode}">
                <input type="text" v-model="promoCode" class="promo-code__body__input">
                <div class="promo-code__body__submit" @click="addCode()">ADD</div>
              </div>
            </div>
          </div>
          <div class="cart-price__footer">
            <div class="cart-price__footer__label">ORDER TOTAL</div>
            <div class="cart-price__footer__price">£234.80</div>
          </div>
        </div>
        <div class="col-md-12 cart-next">NEXT <i class="fa fa-angle-right"></i></div>
      </div>
    </div>
    <div class="row">
      <div class="col-md-12 copyright">Copyright © 2017 Shin Ando. All rights reserved.</div>
    </div>
  </div>
</template>


<script>
  import cartField from './cart_field';

  export default cartField;
</script>
