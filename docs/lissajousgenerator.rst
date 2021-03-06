Lissajous Generator
===================

.. module:: scanpointgenerator

.. autoclass:: LissajousGenerator
    :members:

Examples
--------

This example defines motors "x" and "y" with engineering units "mm" which
will be scanned over a 3x4 lobe Lissajous curve with filling a 1x1mm rectangle.

.. plot::
    :include-source:

    from scanpointgenerator import LissajousGenerator
    from scanpointgenerator.plotgenerator import plot_generator

    gen = LissajousGenerator(['x', 'y'], ["mm", "mm"], [0.0, 0.0], [1.0, 1.0],
            lobes=3, size=50)
    plot_generator(gen)

The number of points has been lowered from the default to make the plot more
visible. The following plot is for 10x11 lobes with the default number of points.

.. plot::
    :include-source:

    from scanpointgenerator import LissajousGenerator
    from scanpointgenerator.plotgenerator import plot_generator

    gen = LissajousGenerator(['x', 'y'], ["mm", "mm"], [0.0, 0.0], [1.0, 1.0],
            lobes=20)
    plot_generator(gen, show_indexes=False)
