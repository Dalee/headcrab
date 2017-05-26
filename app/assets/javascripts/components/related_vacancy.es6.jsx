class RelatedVacancy extends React.Component {
  render () {
    return (
      <div className="related-vacancy">
        <h4 className="related-vacancy__title">
          <a className="related-vacancy__link" href={this.props.link}>{this.props.title}</a>
        </h4>
        {this.props.salary && (
          <div className="related-vacancy__salary">{this.props.salary} ₽</div>
        )}
      </div>
    )
  }
}

RelatedVacancy.propTypes = {
  id: React.PropTypes.number,
  link: React.PropTypes.string,
  title: React.PropTypes.string,
  salary: React.PropTypes.number
}
