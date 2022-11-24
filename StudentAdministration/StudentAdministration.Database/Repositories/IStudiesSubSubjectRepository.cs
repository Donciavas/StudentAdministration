using StudentAdministration.Database.DTOs;
using StudentAdministration.Database.Models;

namespace StudentAdministration.Database.Repositories
{
    public interface IStudiesSubSubjectRepository
    {
        StudiesSubSubject? GetStudiesSubSubject(string name);
        List<StudiesSubSubject>? GetAllStudiesSubSubject();
        ResponseDto SaveStudiesSubSubject(StudiesSubSubject studiesSubSubject);
        void AddSubSubjectToSubSubject(string studiesSubSubjectName, StudiesSubSubject studiesSubSubject);
    }
}
