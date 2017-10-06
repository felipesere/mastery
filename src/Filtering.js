export default class Filtering {
  static filter(modules, term) {
    let lower_term = term.toLowerCase()

    let contains = (elements, term) =>  elements.some(element => element.toLowerCase().includes(term) );

    return modules.filter( (module) => {
      return module.title.toLowerCase().includes(lower_term)
        || module.subtitle.toLowerCase().includes(lower_term)
        || module.description.toLowerCase().includes(lower_term)
        || contains(module.outputs, lower_term)
        || contains(module.outcomes, lower_term)
    })
  }
}
