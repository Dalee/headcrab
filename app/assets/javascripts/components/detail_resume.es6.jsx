class DetailResume extends React.Component {
  render () {
    const contactInfo = this.props.contactInfo.split('\r\n').map((paragraph, index) => {
      return <p key={index}>{paragraph}</p>
    })

    const skills = this.props.skills.map(skill => skill.title).join(', ')

    return (
      <div className="detail-resume">
        <h3 className="detail-resume__name">{this.props.name}</h3>
        <div className="detail-resume__item">
          <div className="detail-resume__label">Контакты:</div>
          <div className="detail-resume__value">{contactInfo}</div>
        </div>
        <div className="detail-resume__item">
          <div className="detail-resume__label">ЗП:</div>
          <div className="detail-resume__value">{this.props.salary} ₽</div>
        </div>
        <div className="detail-resume__item">
          <div className="detail-resume__label">Навыки:</div>
          <div className="detail-resume__value">{skills}</div>
        </div>
      </div>
    )
  }
}

DetailResume.propTypes = {
  contactInfo: React.PropTypes.string,
  link: React.PropTypes.string,
  name: React.PropTypes.string,
  salary: React.PropTypes.number,
  skills: React.PropTypes.array
}
