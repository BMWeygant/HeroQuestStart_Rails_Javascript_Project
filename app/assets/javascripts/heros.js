$(() => {
  bindClickHandlers()
})

const bindClickHandlers = () => {
  $('.all_heros').on('click', (e) => {
    e.preventDefault()
    fetch(`/users/` + $(this).id + `/heros.json`)
      .then(res => res.json())
      .then(heros => {
      $('#app-container').html('')
      heros.forEach(hero => {
        let newHero = new Hero(hero)
        console.log(newHero)
      })
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
