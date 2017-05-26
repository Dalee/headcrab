class VacanciesListPage extends React.Component {
  constructor (props) {
    super(props)

    this.state = {
      query: this.props.query
    }

    this.handleChange = this.handleChange.bind(this)
  }

  handleChange (event) {
    this.setState({ query: event.target.value })
  }

  render () {
    const form = (
      <form className="vacancies-list__form" action={this.props.actions.search} method="GET">
        <input className="vacancies-list__area" type="search" name="query" value={this.state.query} placeholder="Поиск"
               onChange={this.handleChange} />
        <input className="vacancies-list__send" type="submit" value="Найти" />
      </form>
    )

    const vacancies = this.props.vacancies.map(item => {
      return (
        <Vacancy key={item.id} id={item.id} date={item.createdAt} link={item.links.self} title={item.title} salary={item.salary} />
      )
    })

    return (
      <div className="vacancies-list">
        <div className="vacancies-list__head">
          <h1 className="vacancies-list__title">Вакансии</h1>
        </div>
        <div className="vacancies-list__body">
          {form}
          {vacancies}
        </div>
      </div>
    )
  }
}

VacanciesListPage.defaultProps = {
  actions: {
    search: ''
  },
  query: ''
}

VacanciesListPage.propTypes = {
  actions: React.PropTypes.object,
  query: React.PropTypes.string,
  vacancies: React.PropTypes.array
}
