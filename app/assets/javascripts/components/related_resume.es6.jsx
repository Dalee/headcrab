class RelatedResume extends React.Component {
  render () {
    return (
      <div className="related-resume">
        <h4 className="related-resume__name">
          <a className="related-resume__link" href={this.props.link}>{this.props.name}</a>
        </h4>
        {this.props.salary && (
          <div className="related-resume__salary">{this.props.salary} ₽</div>
        )}
      </div>
    )
  }
}

RelatedResume.propTypes = {
  id: React.PropTypes.number,
  link: React.PropTypes.string,
  name: React.PropTypes.string,
  salary: React.PropTypes.number
}
