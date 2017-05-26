class Vacancy extends React.Component {
  render () {
    return (
      <div className="vacancy">
        <h4 className="vacancy__title">
          <a className="vacancy__link" href={this.props.link}>{this.props.title}</a>
        </h4>
        <h6 className="vacancy__date">{this.props.date}</h6>
        {this.props.salary && (
          <div className="vacancy__salary">{this.props.salary} ₽</div>
        )}
      </div>
    )
  }
}

Vacancy.propTypes = {
  id: React.PropTypes.number,
  date: React.PropTypes.string,
  link: React.PropTypes.string,
  title: React.PropTypes.string,
  salary: React.PropTypes.number
}
