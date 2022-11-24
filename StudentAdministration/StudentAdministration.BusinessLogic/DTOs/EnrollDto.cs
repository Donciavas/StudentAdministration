using System.ComponentModel.DataAnnotations;

namespace StudentAdministration.BusinessLogic.DTOs
{
    public class EnrollDto
    {
        [Required]
        [MaxLength(11)]
        public string? StudentPersonalNumber { get; set; }
        [Required]
        public string? ProgramName { get; set; }
        [Required]
        [Range(1900, 2100, ErrorMessage = "Only between 1900 and 2100 year number is allowed")]
        public int EnrollYear { get; set; }
    }
}
