using System.ComponentModel.DataAnnotations;
using System.Text.RegularExpressions;

namespace StudentAdministration.BusinessLogic.Attributes
{
    public class OnlyNumbersAttribute : ValidationAttribute
    {
        protected override ValidationResult? IsValid(
           object? value, ValidationContext validationContext)
        {
            var inValid = new Regex("^[0-9]*$");
            if (value is string input)
            {
                if (!inValid.IsMatch(input))
                {
                    return new ValidationResult(GetErrorMessage());
                }
            }
            return ValidationResult.Success;
        }
        private static string GetErrorMessage()
        {
            return $"Input can't have any other symbols than digits from 0...9";
        }
    }
}
