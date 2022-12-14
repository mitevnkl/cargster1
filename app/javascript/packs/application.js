// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'bootstrap-icons/font/bootstrap-icons.css'

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "controllers"
import "bootstrap"
import { initSelect2 } from '../components/init_select2';
import { showFilter } from '../components/show_filter';
import { initFlatpickr } from "../plugins/flatpickr";

initFlatpickr();


document.addEventListener("turbolinks:load", function () {
  initSelect2();
  showFilter();
  initFlatpickr();
});










