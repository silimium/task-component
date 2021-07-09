<?php

declare(strict_types=1);

use Doctrine\Bundle\DoctrineBundle\Registry;
use PHPUnit\Framework\Assert;
use Silimium\Task\Bundle\Entity\Task;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

class TaskIntegrationTest extends KernelTestCase
{
    public function test_persist_and_load()
    {
        /** @var Registry $doctrine */
        $doctrine = self::getContainer()->get('doctrine');
        $em = $doctrine->getManager();

        $task = new Task();
        $task->label = 'foo';

        $em->persist($task);
        $em->flush();

        $task = $em->getRepository(Task::class)->findOneBy(['label' => 'foo']);
        Assert::assertNotNull($task);
    }
}
