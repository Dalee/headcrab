class DetailVacancy extends React.Component {
  render () {
    const contactInfo = this.props.contactInfo.split('\r\n').map((paragraph, index) => {
      return <p key={index}>{paragraph}</p>
    })

    const skills = this.props.skills.map(skill => skill.title).join(', ')

    return (
      <div className="detail-vacancy">
        <h3 className="detail-vacancy__title">{this.props.title}</h3>
        <div className="detail-vacancy__item">
          <div className="detail-vacancy__label">Контакты:</div>
          <div className="detail-vacancy__value">{contactInfo}</div>
        </div>
        <div className="detail-vacancy__item">
          <div className="detail-vacancy__label">ЗП:</div>
          <div className="detail-vacancy__value">{this.props.salary} ₽</div>
        </div>
        <div className="detail-vacancy__item">
          <div className="detail-vacancy__label">Навыки:</div>
          <div className="detail-vacancy__value">{skills}</div>
        </div>
      </div>
    )
  }
}

DetailVacancy.propTypes = {
  contactInfo: React.PropTypes.string,
  link: React.PropTypes.string,
  title: React.PropTypes.string,
  salary: React.PropTypes.number,
  skills: React.PropTypes.array
}
