<?php

class KvintaRules
{
    public static function getRequiredChoices(): int
    {
        return 2;
    }

    /**
     * @param array $selectedSubjects – pole vybraných předmětů
     * @return array – pole chybových hlášek
     */
    public static function validateSelection(array $selectedSubjects): array
    {
        $errors = [];
        $count = count($selectedSubjects);

        if ($count !== self::getRequiredChoices()) {
            $errors[] = "Musíte vybrat právě " . self::getRequiredChoices() . " volitelné předměty.";
        }

        return $errors;
    }
}