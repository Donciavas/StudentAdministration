using Microsoft.EntityFrameworkCore;
using StudentAdministration.Database.DTOs;
using StudentAdministration.Database.Models;

namespace StudentAdministration.Database.Repositories
{
    public class StudiesSubSubjectRepository : IStudiesSubSubjectRepository
    {
        private readonly ApplicationDbContext _context;
        public StudiesSubSubjectRepository(ApplicationDbContext context)
        {
            _context = context;
        }
        public StudiesSubSubject? GetStudiesSubSubject(string name)
        {
            return _context.StudiesSubSubject?.Include(i => i.SubSubjectListOfSubSubject).
                                               FirstOrDefault(subject => subject.Name == name);
        }
        public List<StudiesSubSubject>? GetAllStudiesSubSubject()
        {
            return _context.StudiesSubSubject?.ToList();
        }
        public ResponseDto SaveStudiesSubSubject(StudiesSubSubject studiesSubSubject)
        {
            try
            {
                _context.StudiesSubSubject?.Add(studiesSubSubject);
                _context.SaveChanges();
                return new ResponseDto(true, "Studies sub subject was saved");
            }
            catch (Exception ex)
            {
                return new ResponseDto(false, $"{ex.Message}");
            }
        }
        public void AddSubSubjectToSubSubject(string studiesSubSubjectName, StudiesSubSubject studiesSubSubject)
        {
            var studiesSubSbject = _context.StudiesSubSubject?.Include(s => s.SubSubjectListOfSubSubject).
                                                               FirstOrDefault(i => i.Name == studiesSubSubjectName);
            studiesSubSbject?.SubSubjectListOfSubSubject?.Add(studiesSubSubject);
            _context.SaveChanges();
        }
    }
}
