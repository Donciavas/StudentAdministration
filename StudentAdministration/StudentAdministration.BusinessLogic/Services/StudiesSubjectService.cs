using StudentAdministration.BusinessLogic.DTOs;
using StudentAdministration.Database.DTOs;
using StudentAdministration.Database.Models;
using StudentAdministration.Database.Repositories;

namespace StudentAdministration.BusinessLogic.Services
{
    public class StudiesSubjectService : IStudiesSubjectService
    {
        private readonly IStudiesProgramRepository _studiesProgramRepository;
        private readonly IStudiesSubjectRepository _studiesSubjectRepository;
        private readonly IMapper _mapper;
        public StudiesSubjectService(IMapper mapper,
                                     IStudiesProgramRepository studiesProgramRepository,
                                     IStudiesSubjectRepository studiesSubjectRepository)
        {
            _mapper = mapper;
            _studiesProgramRepository = studiesProgramRepository;
            _studiesSubjectRepository = studiesSubjectRepository;
        }
        public List<StudiesSubject>? GetAllStudiesSubject()
        {
            return _studiesSubjectRepository.GetAllStudiesSubject();
        }
        public ResponseDto SaveStudiesSubjectToProgram(InputDto inputDto)
        {
            var existSubjectName = _studiesSubjectRepository.GetStudiesSubject(inputDto.Name!);
            if (existSubjectName is null)
            {
                var studiesProgram = _studiesProgramRepository.GetStudiesProgram(inputDto.BelongsToName!);
                var usedCredits = 0;
                if (studiesProgram != null)
                {
                    if (studiesProgram.SubjectList != null)
                    {
                        foreach (var subject in studiesProgram.SubjectList)
                        {
                            usedCredits += subject.Credits;
                        }
                    }
                    if (studiesProgram.SubSubjectList != null)
                    {
                        foreach (var subSubject in studiesProgram.SubSubjectList)
                        {
                            usedCredits += subSubject.Credits;
                        }
                    }
                    usedCredits += inputDto.Credits;
                    if (studiesProgram.Credits < usedCredits)
                        return new ResponseDto(false, $"New Subject exceeds studies programe credit limit {studiesProgram.Credits - usedCredits} by credits");
                    else
                    {
                        var newStudiesSubject = _mapper.MapInputDtoToStudiesSubject(inputDto);
                        var response = _studiesSubjectRepository.SaveStudiesSubject(newStudiesSubject);
                        _studiesProgramRepository.AddSubjectToProgram(inputDto.BelongsToName!, newStudiesSubject);
                        return response;
                    }
                }
                else
                    return new ResponseDto(false, $"Bad program Name");
            }
            else
                return new ResponseDto(false, $"This Subject is already added");
        }
    }
}
