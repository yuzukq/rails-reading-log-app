# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"

pin "scroll-hint", to: "https://unpkg.com/scroll-hint@1.1.4/js/scroll-hint.min.js"
pin "scroll-hint", to: "https://unpkg.com/scroll-hint@1.1.4/css/scroll-hint.css"

