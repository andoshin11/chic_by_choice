import HTTP from './../http';
import datePicker from './../vue/date_picker.vue';
import sharedStore from './../shared_store';
import favorite from './../vue/favorite.vue';

export default {
  components: {
    datePicker,
    favorite,
  },
  computed: {
    primaryUnit() {
      const unit = this.item.units.filter(x => x.id == this.primaryUnitId)[0];
      return unit ? unit : {size: null, length: null};
    },
    secondaryUnit() {
      const unit = this.item.units.filter(x => x.id == this.secondaryUnitId)[0];
      return unit ? unit : {size: null, length: null};
    },
    dataValid() {
      return this.primaryUnit && this.order.eventDate && this.order.deliveryDate && this.order.returnDate
    }
  },
  data() {
    return {
      item: {
        name: null,
        price: {
          currency: null,
        },
        units: [],
        designer: {
          name: null,
        }
      },
      selectedDate: null,
      order: {
        period: 4,
        eventDate: null,
        deliveryDate: null,
        returnDate: null,
      },
      slideRight: false,
      primaryUnitId: null,
      secondaryUnitId: null,
      selectSecondary: false,
      isCartEmpty: true,
    };
  },
  methods: {
    async fetch() {
      try {
        const { cart: cart } = await HTTP.get('/api/carts');
        if(cart.items.length) this.isCartEmpty = false;
        const { item: item } = await HTTP.get(`/api/items/${gon.item_id}`);
        this.item = item;
      } catch (e) {
        console.error(e);
      }
    },
    async addToCart() {
      try {
        if (this.dataValid){
          await HTTP.post('/api/cart_items', {
            primaryUnit: this.primaryUnit,
            secondaryUnit: this.secondaryUnit,
            price: this.item.price.hirePrice,
            currencyId: this.item.price.currencyId,
            period: this.order.period,
            eventDate: this.order.eventDate,
            deliveryDate: this.order.deliveryDate,
            returnDate: this.order.returnDate,
            designerName: this.item.designer.name,
            itemName: this.item.name,
          });
          const { cart: cart } = await HTTP.get('/api/carts');
          sharedStore.cart.items = cart.items;
          alert("Your order was added to the cart!");
        } else {
          alert("Please make sure your Primary Size and Event Date info is properly selected.");
        }
      } catch (e) {
        console.error(e);
      }
    },
    toggleSlide(image){
      this.slideRight = image.category==1 ? false : true;
    }
  },
  watch: {
  },
  mounted() {
    this.fetch();
  },
};
