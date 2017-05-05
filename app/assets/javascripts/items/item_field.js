import HTTP from './../http';
import datePicker from './../vue/date_picker.vue'

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
        }
      },
      selectedDate: null,
      order: {
        period: 4,
        eventDate: null,
        deliveryDate: null,
        returnDate: null,
      }
    };
  },
  methods: {
    async fetch() {
      try {
        const { item: item } = await HTTP.get('/api/items/1');
        this.item = item;
      } catch (e) {
        console.error(e);
      }
    },
  },
  watch: {
  },
  mounted() {
    this.fetch();
  },
};
