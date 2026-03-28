<?php

class SextaRules
{
    public static function getMaxHours(): int
    {
        return 5;
    }

    public static function requiresRequiredChoice(): bool
    {
        return true;
    }

    public static function getRequiredChoiceCount(): int
    {
        return 1;
    }

    /**
     * @param array $selectedSubjects – pole předmětů (každý předmět má např. 'hours', 'is_required_choice')
     * @return array – pole chyb (pokud je prázdné, výběr je platný)
     */
    public static function validateSelection(array $selectedSubjects): array
    {
        $errors = [];
        $totalHours = 0;
        $requiredCount = 0;

        foreach ($selectedSubjects as $subject) {
            $totalHours += (int)$subject['hours'];
            if (!empty($subject['is_required_choice'])) {
                $requiredCount++;
            }
        }

        if ($totalHours !== self::getMaxHours()) {
            $errors[] = "Musíte vybrat přesně " . self::getMaxHours() . " hodin.";
        }

        if (self::requiresRequiredChoice() && $requiredCount < self::getRequiredChoiceCount()) {
            $errors[] = "Musíte vybrat alespoň " . self::getRequiredChoiceCount() . " povinně volitelný předmět (např. výtvarka nebo hudebka).";
        }

        return $errors;
    }
}