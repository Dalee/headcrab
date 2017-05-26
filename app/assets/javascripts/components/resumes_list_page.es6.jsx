class ResumesListPage extends React.Component {
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
      <form className="resumes-list__form" action={this.props.actions.search} method="GET">
        <input className="resumes-list__area" type="search" name="query" value={this.state.query} placeholder="Поиск"
               onChange={this.handleChange} />
        <input className="resumes-list__send" type="submit" value="Найти" />
      </form>
    )

    const resumes = this.props.resumes.map(item => {
      return (
        <Resume key={item.id} id={item.id} date={item.createdAt} link={item.links.self} name={item.name} salary={item.expectedSalary} />
      )
    })

    return (
      <div className="resumes-list">
        <div className="resumes-list__head">
          <h1 className="resumes-list__title">Специалисты</h1>
        </div>
        <div className="resumes-list__body">
          {form}
          {resumes}
        </div>
      </div>
    )
  }
}

ResumesListPage.defaultProps = {
  actions: {
    search: ''
  },
  query: ''
}

ResumesListPage.propTypes = {
  actions: React.PropTypes.object,
  query: React.PropTypes.string,
  resumes: React.PropTypes.array
}
