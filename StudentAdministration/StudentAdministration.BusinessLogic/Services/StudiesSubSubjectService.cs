using StudentAdministration.BusinessLogic.DTOs;
using StudentAdministration.Database.DTOs;
using StudentAdministration.Database.Models;
using StudentAdministration.Database.Repositories;

namespace StudentAdministration.BusinessLogic.Services
{
    public class StudiesSubSubjectService : IStudiesSubSubjectService
    {
        private readonly IStudiesProgramRepository _studiesProgramRepository;
        private readonly IStudiesSubjectRepository _studiesSubjectRepository;
        private readonly IStudiesSubSubjectRepository _studiesSubSubjectRepository;
        private readonly IMapper _mapper;
        public StudiesSubSubjectService(IMapper mapper,
                                        IStudiesProgramRepository studiesProgramRepository,
                                        IStudiesSubjectRepository studiesSubjectRepository,
                                        IStudiesSubSubjectRepository studiesSubSubjectRepository)
        {
            _mapper = mapper;
            _studiesProgramRepository = studiesProgramRepository;
            _studiesSubjectRepository = studiesSubjectRepository;
            _studiesSubSubjectRepository = studiesSubSubjectRepository;
        }
        public List<StudiesSubSubject>? GetAllStudiesSubSubject()
        {
            return _studiesSubSubjectRepository.GetAllStudiesSubSubject();
        }
        public ResponseDto SaveStudiesSubSubjectToProgram(InputDto inputDto)
        {
            var existSubSubjectName = _studiesSubSubjectRepository.GetStudiesSubSubject(inputDto.Name!);
            if (existSubSubjectName is null)
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
                        return new ResponseDto(false, $"New sub subject exceeds studies programe credit limit {studiesProgram.Credits - usedCredits} by credits");
                    else
                    {
                        var newStudiesSubSubject = _mapper.MapInputDtoToStudiesSubSubject(inputDto);
                        var response = _studiesSubSubjectRepository.SaveStudiesSubSubject(newStudiesSubSubject);
                        _studiesProgramRepository.AddSubSubjectToProgram(inputDto.BelongsToName!, newStudiesSubSubject);
                        return response;
                    }
                }
                else
                    return new ResponseDto(false, $"Bad program Name");
            }
            else
                return new ResponseDto(false, $"This SubSubject is already added");
        }
        public ResponseDto SaveStudiesSubSubjectToSubSubject(InputDto inputDto)
        {
            var existSubSubjectName = _studiesSubSubjectRepository.GetStudiesSubSubject(inputDto.Name!);
            if (existSubSubjectName is null)
            {
                var studiesSubSubject = _studiesSubSubjectRepository.GetStudiesSubSubject(inputDto.BelongsToName!);
                var usedCredits = 0;
                if (studiesSubSubject != null)
                {
                    if (studiesSubSubject.SubSubjectListOfSubSubject != null)
                    {
                        foreach (var subSubject in studiesSubSubject.SubSubjectListOfSubSubject)
                        {
                            usedCredits += subSubject.Credits;
                        }
                    }
                    usedCredits += inputDto.Credits;
                    if (studiesSubSubject.Credits < usedCredits)
                        return new ResponseDto(false, $"New sub subject exceeds studies sub subject credit limit {studiesSubSubject.Credits - usedCredits} by credits");
                    else
                    {
                        var newStudiesSubSubject = _mapper.MapInputDtoToStudiesSubSubject(inputDto);
                        var response = _studiesSubSubjectRepository.SaveStudiesSubSubject(newStudiesSubSubject);
                        _studiesSubSubjectRepository.AddSubSubjectToSubSubject(inputDto.BelongsToName!, newStudiesSubSubject);
                        return response;
                    }
                }
                else
                    return new ResponseDto(false, $"Bad sub subject name");
            }
            else
                return new ResponseDto(false, $"This SubSubject is already added");
        }
        public ResponseDto SaveStudiesSubSubjectToSubject(InputDto inputDto)
        {
            var existSubSubjectName = _studiesSubSubjectRepository.GetStudiesSubSubject(inputDto.Name!);
            if (existSubSubjectName is null)
            {
                var studiesSubject = _studiesSubjectRepository.GetStudiesSubject(inputDto.BelongsToName!);
                var usedCredits = 0;
                if (studiesSubject != null)
                {
                    if (studiesSubject.SubSubjectList != null)
                    {
                        foreach (var subject in studiesSubject.SubSubjectList)
                        {
                            usedCredits += subject.Credits;
                        }
                    }
                    usedCredits += inputDto.Credits;
                    if (studiesSubject.Credits < usedCredits)
                        return new ResponseDto(false, $"New Subject exceeds studies sub subject credit limit {studiesSubject.Credits - usedCredits} by credits");
                    else
                    {
                        var newStudiesSubSubject = _mapper.MapInputDtoToStudiesSubSubject(inputDto);
                        var response = _studiesSubSubjectRepository.SaveStudiesSubSubject(newStudiesSubSubject);
                        _studiesSubjectRepository.AddSubSubjectToSubject(inputDto.BelongsToName!, newStudiesSubSubject);
                        return response;
                    }
                }
                else
                    return new ResponseDto(false, $"Bad sub subject name");
            }
            else
                return new ResponseDto(false, $"This SubSubject is already added");
        }
    }
}
