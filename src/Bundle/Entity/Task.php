<?php

declare(strict_types=1);

namespace Silimium\Task\Bundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity
 * @ORM\Table(name="task_task")
 */
class Task
{
    /**
     * @ORM\Id
     * @ORM\Column(type="integer", unique=true)
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private int $id;

    /**
     * @ORM\Column(type="string", nullable=false)
     */
    public string $label;

    public function getId(): int
    {
        return $this->id;
    }
}
