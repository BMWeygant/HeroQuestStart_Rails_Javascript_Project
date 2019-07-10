$(() => {
  bindClickHandlers()
})

const bindClickHandlers = () => {
  $('.all_heros').on('click', (e) => {
    e.preventDefault()
    getHeros()
  })

  $(document).on('click', '.show_hero', function(e) {
    e.preventDefault()
    $('#app-container').html('')
    let id = $(this).attr('data-id')
    // window.history.pushState(null, null, `${this}`)
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
    $('#app-container').html('')
    heros.forEach(hero => {
      let newHero = new Hero(hero)
      let heroHtml = newHero.formatIndex()
      $('#app-container').append(heroHtml)
    })
  })
}

function Hero(hero) {
  this.id = hero.id
  this.name = hero.name
  this.hp = hero.hp
  this.treasure = hero.treasure
  this.total_xp = hero.total_xp
  this.user = hero.user
  this.incapacitated = hero.incapacitated
}

Hero.prototype.formatIndex = function(){
  let heroHtml = `
<br>

   <a href="/heros/${this.id}" data-id="${this.id}" class="show_hero"> <h3>${this.name}</h3> <br></a>

  `


  return heroHtml
}

Hero.prototype.formatShow= function(){
  let heroHtml = `

  <h1>${this.name}</h1>
  <h3>HP: ${this.hp}</h3>
  <h3>Treasure: ${this.treasure}</h3>
  <h3>XP: ${this.total_xp}</h3>
  <h3>Incapacitated: ${this.incapacitated}</h3>

  `
  return heroHtml
}
