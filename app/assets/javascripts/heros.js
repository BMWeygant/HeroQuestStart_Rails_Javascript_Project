$(() => {
  bindClickHandlers()
})

const bindClickHandlers = () => {
  $('.all_heros').on('click', (e) => {
    e.preventDefault()
    console.log('wtf')
  })
}
