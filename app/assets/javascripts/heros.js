$(() => {
  bindClickHandlers()
})

const bindClickHandlers = () => {
  $('.all_heros').on('click', (e) => {
    e.preventDefault()
    history.pushState(null, null, "heros")
    getHeros()
  })

  $(document).on('click', '.show_link', function(e) {
    e.preventDefault()
    $('#app-container').html('')
    let id = $(this).attr('data-id')
    history.pushState(null, null, `heros/${id}`)
    fetch(`/heros/${id}.json`)
    .then(res => res.json())
    .then(hero => {
      let newHero = new Hero(hero)
      let heroHtml = newHero.formatShow()
      $('#app-container').append(heroHtml)
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

   <a href="/heros/${this.id}" data-id="${this.id}" class="show_link"> <h1>${this.name}</h1> <br></a>

  `


  return heroHtml
}

Hero.prototype.formatShow= function(){
  let heroHtml = `

  <h1>${this.name}</h1>

  `
  return heroHtml
}
