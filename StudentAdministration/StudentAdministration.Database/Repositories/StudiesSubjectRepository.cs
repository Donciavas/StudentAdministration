using Microsoft.EntityFrameworkCore;
using StudentAdministration.Database.DTOs;
using StudentAdministration.Database.Models;

namespace StudentAdministration.Database.Repositories
{
    public class StudiesSubjectRepository : IStudiesSubjectRepository
    {
        private readonly ApplicationDbContext _context;
        public StudiesSubjectRepository(ApplicationDbContext context)
        {
            _context = context;
        }
        public StudiesSubject? GetStudiesSubject(string name)
        {
            return _context.StudiesSubject?.Include(i => i.SubSubjectList).
                                            FirstOrDefault(subject => subject.Name == name);
        }
        public List<StudiesSubject>? GetAllStudiesSubject()
        {
            return _context.StudiesSubject?.ToList();
        }
        public ResponseDto SaveStudiesSubject(StudiesSubject studiesSubject)
        {
            try
            {
                _context.StudiesSubject?.Add(studiesSubject);
                _context.SaveChanges();
                return new ResponseDto(true, "Studies subject was saved");
            }
            catch (Exception ex)
            {
                return new ResponseDto(false, $"{ex.Message}");
            }
        }
        public void AddSubSubjectToSubject(string studiesSubjectName, StudiesSubSubject studiesSubSubject)
        {
            var studiesSbject = _context.StudiesSubject?.Include(s => s.SubSubjectList).
                                                         FirstOrDefault(i => i.Name == studiesSubjectName);
            studiesSbject?.SubSubjectList?.Add(studiesSubSubject);
            _context.SaveChanges();
        }
    }
}
