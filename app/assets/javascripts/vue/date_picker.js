import moment from 'moment';
import Vue from 'vue';

export default {
  props: {
    period: {
      require: true,
    }
  },
  computed: {
    weeks() {
      const weeks = []
      const numWeeks = this.dates.length / 7;

      for (let i = 0; i < numWeeks; i++) {
        weeks.push(this.dates.slice(i * 7, (i * 7) + 7));
      }
      return weeks;
    },
  },
  data () {
    return {
      show: false,
      days: ['su', 'mo', 'tu', 'we', 'th', 'fr', 'sa'],
      currentDate: moment().hour(0).minute(0).second(0),
      selectedDate: null,
      returnDate: null,
      deliveryDate: null,
      eventDate: null,
      dates: [],
    };
  },
  watch: {
    // currentDate () {
    //   this.setDates();
    // },
    show () {
      if (this.show == true) this.setDates();
    },
    selectedDate () {
      this.setDates();
      this.$parent.order.eventDate = this.selectedDate;
      this.$parent.order.deliveryDate = this.deliveryDate.format("YYYY/MM/DD");
      this.$parent.order.returnDate = this.returnDate.format("YYYY/MM/DD");
    },
    period () {
      this.calcSchedule(this.eventDate);
      this.pickDate(this.eventDate);
    }
  },
  methods: {
    setDates() {
      //引数で渡って来た日付の月のカレンダーに必要な日付の配列を生成
      const dates = [];
      const firstDate = moment([this.currentDate.year(), this.currentDate.month(), 1]);
      const lastDate = firstDate.clone().add(this.currentDate.daysInMonth() - 1, "d");

      // the last week of the last month
      for (let i = firstDate.day(); i > 0; i--) {
          const targetDate = firstDate.clone().subtract(i, "d");
          dates.push(targetDate);
      }

      // dates from current month
      for (let i = 0; i < this.currentDate.daysInMonth(); i++) {
          const targetDate = firstDate.clone().add(i, "d");
          dates.push(targetDate);
      }

      // ths first week of the next month
      for (let i = 1; i < (7 - lastDate.day()); i++) {
          const targetDate = lastDate.clone().add(i, "d");
          dates.push(targetDate);
      }

      this.dates = dates.map(x => {

        return {
          date: x,
          dateString: x.format("D"),
          fullString: x.format("YYYY/MM/DD"),
          isCurrentMonth: x.month() == this.currentDate.month(),
          isReturnDate: false,
          isDeliveryDate: false,
          isHiringPeriod: false,
        }
      });
    },
    changeYear (flag) {
      this.currentDate.add(flag, "years");
      this.setDates();
    },
    changeMonth (flag) {
      this.currentDate.add(flag, "months");
      this.setDates();
    },
    pickDate (date) {
      this.selectedDate = date.format("YYYY/MM/DD");
      this.show = false;
    },
    resetSchedule() {
      this.deliveryDate = null;
      this.returnDate = null;
    },
    calcSchedule(date) {
      this.resetSchedule();
      this.eventDate = date;
      const day = date.day();
      const period = this.period;

      if(day == 0 || day == 1 || day == 4) {
        this.deliveryDate = date.clone().subtract(2, "d");
        // this.returnDate = date.clone().add(1, "d");
      } else if (day == 5) {
        this.deliveryDate = date.clone().subtract(1, "d");
        // this.returnDate = date.clone().add(3, "d");
      } else {
        this.deliveryDate = date.clone().subtract(1, "d");
        // this.returnDate = date.clone().add(2, "d");
      }
      this.returnDate = this.deliveryDate.clone().add(period - 1, "d");
      if (this.returnDate.day() == 0) this.returnDate.add(1, "d");

      this.dates.forEach(x => {
        x.isReturnDate = false;
        x.isDeliveryDate = false;
        x.isHiringPeriod = false;
      })

      const deliveryDate = this.dates.find(x => x.date.format("x") == this.deliveryDate.format("x"));
      if (deliveryDate) deliveryDate.isDeliveryDate = true;

      const returnDate = this.dates.find(x => x.date.format("x") == this.returnDate.format("x"));
      if (returnDate) returnDate.isReturnDate = true;

      this.dates.filter(x => x.date.diff(this.deliveryDate) > 0 && x.date.diff(this.returnDate) < 0).forEach(e => e.isHiringPeriod = true);

      // console.log("event date is " + date.format("YYYY/MM/DD"));
      // console.log("delivery date is " + this.deliveryDate.format("YYYY/MM/DD"));
      // console.log("return date is " + this.returnDate.format("YYYY/MM/DD"));
    },
  },
};
