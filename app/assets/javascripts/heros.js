$(() => {
  bindClickHandlers()
})

const bindClickHandlers = () => {
  $(document).on('click', '.all_heros', function(e) {
    e.preventDefault()
    getHeros()
    window.history.pushState({}, '', `${this}`)
  })

  $(document).on('click', '.show_hero', function(e) {
    e.preventDefault()
    $('#app-container').html('')
    let id = $(this).attr('data-id')
     window.history.pushState({}, '', `${this}`)
    fetch(`/heros/${id}.json`)
    .then(res => res.json())
    .then(hero => {
      let newHero = new Hero(hero)
      let heroHtml = newHero.formatShow()
      $('#app-container').append(heroHtml)
    })
  })

  $('#new_hero').on('submit', function(e){
    e.preventDefault()

    const values = $(this).serialize()

    $.post('/heros', values).done(function(data) {
      $('#app-container').html('')
      const newHero = new Hero(data)
      const htmlToAdd = newHero.formatShow()
      $('#app-container').html(htmlToAdd)

    })
  })
}

const getHeros = () => {
  fetch(`/heros.json`)
    .then(res => res.json())
    .then(heros => {
    $('#app-container').html("<h1>All the King's Heros!</h1>")
    heros.forEach(hero => {
      let newHero = new Hero(hero)
      let heroHtml = newHero.formatIndex()
      $('#app-container').append(heroHtml)
    })
    $('#app-container').append(`<a href="/heros/new" class="new_hero"> <h2>Or Create a New Hero!</h2></a>`)
  })
}

function Hero(hero) {
  this.id = hero.id
  this.name = hero.name
  this.hp = hero.hp
  this.treasure = hero.treasure
  this.total_xp = hero.total_xp
  this.user = hero.user
  this.adventures = hero.adventures
  this.incapacitated = hero.incapacitated
}


Hero.prototype.formatIndex = function(){
  let heroHtml = `

   <a href="/heros/${this.id}" data-id="${this.id}" class="show_hero"> <h2>${this.name}</h2></a>
   <p>HP: ${this.hp} <br>
   Treasure: ${this.treasure}<br>
   XP: ${this.total_xp}<br>
   Incapacitated: ${this.incapacitated}</p>

  `


  return heroHtml
}

Hero.prototype.formatShow= function(){

  let thisShitIsStupidHtml = ``
    this.adventures.forEach((adventure) => {
      thisShitIsStupidHtml += `<li>Adventur Id: ${adventure.id} - Brought Little Sister?: ${adventure.little_sister}</li>`
    })

  let heroHtml = `

  <h1>Welcome to ${this.name}'s home MiLord!</h1>
  <h3>Hero: ${this.name}</h3>
  <h3>HP: ${this.hp}</h3>
  <h3>Treasure: ${this.treasure}</h3>
  <h3>XP: ${this.total_xp}</h3>
  <h3>Incapacitated: ${this.incapacitated}</h3>
  <h3>Adventures Info : ${thisShitIsStupidHtml}</h3>


  `
  return heroHtml
}
