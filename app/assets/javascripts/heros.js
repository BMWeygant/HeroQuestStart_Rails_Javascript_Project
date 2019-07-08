$(() => {
  bindClickHandlers()
})

const bindClickHandlers = () => {
  $('.all_heros').on('click', (e) => {
    e.preventDefault()
    history.pushState(null, null, "heros")
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
  })

  $(document).on('click', ".show_link", (e) => {
    e.preventDefault()
    console.log(this)
    //fetch(`/heros/${}.json`)
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

  <a href="/heros/${this.id}" class="show_link"<h1>${this.name}</h1></a>

  `
  return heroHtml
}
