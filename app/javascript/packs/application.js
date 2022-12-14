// import '@fortawesome/fontawesome-free/js/all'
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.


import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"




Rails.start()
Turbolinks.start()
ActiveStorage.start()

const images = require.context('../images', true)
const imagePath = (name) => images(name, true)

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application"
import "preview.js"
import "./slick"

import raty from 'raty-js'

 import Raty from "raty.js"
 window.raty = function(elem,opt){
    let raty =  new Raty(elem,opt)
    raty.init();
    return raty;
}