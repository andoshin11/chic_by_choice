import HTTP from './../http';
import datePicker from './../vue/date_picker.vue'
import $ from 'jQuery';

export default {
  components: {
    datePicker,
  },
  data() {
    return {
      item: {
        name: null,
        price: {
          currency: null,
        },
        units: []
      },
      selectedDate: null,
      order: {
        period: 4,
        eventDate: null,
        deliveryDate: null,
        returnDate: null,
      },
      slideRight: false,
    };
  },
  methods: {
    async fetch() {
      try {
        const { item: item } = await HTTP.get(`/api/items/${gon.item_id}`);
        this.item = item;
      } catch (e) {
        console.error(e);
      }
    },
    async addToCart() {
      try {
        await HTTP.post('/api/cart_items', {
          unitId: 1,
          numUnits: 1,
          name: this.item.name,
          price: this.item.price.hirePrice,
          period: this.order.period,
          eventDate: this.order.eventDate,
          deliveryDate: this.order.deliveryDate,
          returnDate: this.order.returnDate,
        });
        alert("送信されました");
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
