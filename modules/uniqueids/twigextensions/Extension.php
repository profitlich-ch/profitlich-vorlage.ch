<?php
namespace modules\uniqueids\twigextensions;

use Craft;
use craft\helpers\StringHelper;
use Twig\Extension\AbstractExtension;
use Twig\TwigFunction;
use Twig\TwigFilter;

// class Extension extends \Twig_Extension implements \Twig_Extension_GlobalsInterface
class Extension extends AbstractExtension
{
    public function getName(): string
    {
        return 'uniqueIds Twig Extension';
    }

    // Alle Twig extension Funktionen müssen in der getFunctions() definiert werden
    // Sie erhalten dabei einen Namen in snake case, über den sie in Twig angesprochen werden:
    // {{ name_der_funktion() }}
    public function getFunctions(): array
    {
        return [
            new TwigFunction('uniqueid', [$this, 'getUniqueId']),
        ];
    }

    /**
     * getUniqueId
     *
     * @return string
     */
    public function getUniqueId(): string 
    {
        // generate a random string
        $id = StringHelper::randomString('12');

        // check if it's already set
        if (isset($uniqueIds)) { 
            while (\in_array($id, $this->uniqueIds, true)){
                // if so, use another one
                $id = StringHelper::randomString('12');
            }
        }
        // set it as "used"
        $this->uniqueIds[] = $id;

        return $id;
    }
}