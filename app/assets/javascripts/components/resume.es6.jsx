class Resume extends React.Component {
  render () {
    return (
      <div className="resume">
        <h4 className="resume__name">
          <a className="resume__link" href={this.props.link}>{this.props.name}</a>
        </h4>
        <h6 className="resume__date">{this.props.date}</h6>
        {this.props.salary && (
          <div className="resume__salary">{this.props.salary} ₽</div>
        )}
      </div>
    )
  }
}

Resume.propTypes = {
  id: React.PropTypes.number,
  date: React.PropTypes.string,
  link: React.PropTypes.string,
  name: React.PropTypes.string,
  salary: React.PropTypes.number
}
