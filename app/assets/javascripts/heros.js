$(() => {
  bindClickHandlers()
})

const bindClickHandlers = () => {
  $('.all_heros').on('click', (e) => {
    e.preventDefault()
    console.log('wtf')
  })
}

// const bindClickHandlers = () => {
//   $('.all_heros').on('click', (e) => {
//     e.preventDefault()
//     fetch(`/users/:user_id/heros.json`)
//       .then(res => res.json())
//       .then(data => console.log(data))
//   })
// }
