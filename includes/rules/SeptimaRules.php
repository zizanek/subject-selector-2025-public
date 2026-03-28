<?php

class SeptimaRules
{
    // Maximální počet hodin, které si student může zapsat
    public static function getMaxHours(): int
    {
        return 4;
    }

    // Minimální počet „povinně volitelných“ – zatím žádné nejsou
    public static function getMinRequiredChoices(): int
    {
        return 0;
    }

    // Název třídy (zobrazený titulek)
    public static function getTitle(): string
    {
        return 'Výběr volitelných předmětů – Septima';
    }

    // Zpráva, která se ukáže při překročení výběru nebo chybě
    public static function getValidationMessage(): string
    {
        return 'Musíte vybrat přesně 4 hodiny.';
    }

    // Barva indikátoru – můžeme upravit, ale necháváme jako základní text
    public static function getSuccessColorClass(): string
    {
        return 'text-success';
    }

    public static function getDangerColorClass(): string
    {
        return 'text-danger';
    }
}