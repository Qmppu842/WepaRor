const BREWERIES = {}

BREWERIES.show = () => {
  $("#brewerytable tr:gt(0)").remove()
  const table = $("#brewerytable")

  BREWERIES.list.forEach((brewery) =>{
    let future = '<tr>'
    + '<td>' + brewery['name'] + '</td>'
    + '<td>' + brewery['year'] + '</td>'
    + '<td>' + brewery['beers'] + '</td>'

    if (brewery['active']) {
      future +=  '<td>Yes</td>'
    }else {
      future +=  '<td>No</td>'
    }
    future += '</tr>'

    table.append(future)
  })
}
BREWERIES.sort_by_name = () =>{
  BREWERIES.list.sort((a,b) => {
    return a.name.toUpperCase().localeCompare(b.name.toUpperCase())
  })
}
BREWERIES.sort_by_year = () =>{
  BREWERIES.list.sort((a,b) => {
    return b.year - a.year
  })
}
BREWERIES.sort_by_beers = () =>{
  BREWERIES.list.sort((a,b) => {
    return b.beers - a.beers
  })
}
document.addEventListener("turbolinks:load", () => {
  console.log("moiu")
  if ($("#brewerytable").length == 0) {
    return
  }

  $("#name").click((e) =>{
    e.preventDefault()
    BREWERIES.sort_by_name()
    BREWERIES.show()
  })
  $("#year").click((e) =>{
    e.preventDefault()
    BREWERIES.sort_by_year()
    BREWERIES.show()
  })
  $("#beers").click((e) =>{
    e.preventDefault()
    BREWERIES.sort_by_beers()
    BREWERIES.show()
  })
  $("#active").click((e) =>{
    e.preventDefault()
    BREWERIES.sort_by_name()
    BREWERIES.show()
  })


  $.getJSON('breweries.json', (breweries) => {
    panimot = breweries
    BREWERIES.list = breweries
    BREWERIES.show()
  })
})
