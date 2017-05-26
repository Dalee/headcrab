class ResumesItemPage extends React.Component {
  render () {
    const fullRelatedVacancies = this.props.fullRelatedVacancies.map(item => {
      return <RelatedVacancy key={item.id} id={item.id} link={item.links.self} title={item.title} salary={item.salary} />
    })

    const relatedVacancies = this.props.relatedVacancies.map(item => {
      return <RelatedVacancy key={item.id} id={item.id} link={item.links.self} title={item.title} salary={item.salary} />
    })

    return (
      <div className="resumes-item">
        <div className="resumes-item__head">
          <h1 className="resumes-item__title">Просмотр резюме</h1>
        </div>
        <div className="resumes-item__body">
          <div className="resumes-item__resume">
            <DetailResume contactInfo={this.props.resume.contactInfo}
                          name={this.props.resume.name}
                          skills={this.props.resume.skills}
                          salary={this.props.resume.expectedSalary} />
          </div>
          <div className="resumes-item__related">
            <h4 className="resumes-item__label">Полностью подходящие вакансии:</h4>
            {fullRelatedVacancies}
          </div>
          <div className="resumes-item__related">
            <h4 className="resumes-item__label">Частично подходящие вакансии:</h4>
            {relatedVacancies}
          </div>
        </div>
      </div>
    )
  }
}

ResumesItemPage.defaultProps = {
  fullRelatedVacancies: [],
  relatedVacancies: []
}

ResumesItemPage.propTypes = {
  resume: React.PropTypes.object,
  fullRelatedVacancies: React.PropTypes.array,
  relatedVacancies: React.PropTypes.array
}
