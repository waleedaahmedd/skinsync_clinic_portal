import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

/// Shows the E-Signature dialog.
/// Usage: ESignatureDialog.show(context);
class ESignatureDialog extends StatefulWidget {
  const ESignatureDialog({super.key});

  static Future<ui.Image?> show(BuildContext context) {
    return showDialog<ui.Image?>(
      context: context,
      barrierColor: Colors.black54,
      builder: (_) => const ESignatureDialog(),
    );
  }

  @override
  State<ESignatureDialog> createState() => _ESignatureDialogState();
}

class _ESignatureDialogState extends State<ESignatureDialog> {
  final GlobalKey<SfSignaturePadState> _signatureKey =
      GlobalKey<SfSignaturePadState>();

  // Toolbar state
  double _strokeSize = 3.0;
  Color _strokeColor = Colors.black;
  Color _backgroundColor = Colors.white;

  // Which toolbar tab is active
  int _activeTab = -1;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Container(
        width: 540,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(),
            _buildSignaturePad(),
            _buildToolbar(),
            _buildActions(),
          ],
        ),
      ),
    );
  }

  // ── Header ──────────────────────────────────────────────────────────────────

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 12, 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'E - Signature',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Draw Your E - signature for the onboarding form',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () => Navigator.pop(context, null),
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black26),
              ),
              child: const Icon(Icons.close, size: 16, color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }

  // ── Signature Pad ────────────────────────────────────────────────────────────

  Widget _buildSignaturePad() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 220,
        decoration: BoxDecoration(
          color: _backgroundColor,
          border: Border.all(color: const Color(0xFFE0E0E0)),
          borderRadius: BorderRadius.circular(6),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: SfSignaturePad(
            key: _signatureKey,
            backgroundColor: _backgroundColor,
            strokeColor: _strokeColor,
            minimumStrokeWidth: _strokeSize * 0.8,
            maximumStrokeWidth: _strokeSize * 1.6,
          ),
        ),
      ),
    );
  }

  // ── Toolbar ──────────────────────────────────────────────────────────────────

  Widget _buildToolbar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          _toolbarButton(
            icon: Icons.format_size,
            label: 'Size',
            index: 0,
            onTap: () => _showSizeOptions(),
          ),
          _toolbarButton(
            icon: Icons.palette_outlined,
            label: 'Color',
            index: 1,
            onTap: () => _showColorOptions(),
          ),
          _toolbarButton(
            icon: Icons.style_outlined,
            label: 'Style',
            index: 2,
            onTap: () {},
          ),
          _toolbarButton(
            icon: Icons.wallpaper_outlined,
            label: 'Background',
            index: 3,
            onTap: () => _showBackgroundOptions(),
          ),
          _toolbarButton(
            icon: Icons.gesture,
            label: 'Swash',
            index: 4,
            onTap: () {},
          ),
          const Spacer(),
          // Undo
          IconButton(
            onPressed: () => _signatureKey.currentState?.clear(),
            icon: const Icon(Icons.undo, size: 20, color: Colors.black45),
            tooltip: 'Clear',
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
          ),
          // Redo placeholder
          IconButton(
            onPressed: null,
            icon: const Icon(Icons.redo, size: 20, color: Colors.black26),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
          ),
        ],
      ),
    );
  }

  Widget _toolbarButton({
    required IconData icon,
    required String label,
    required int index,
    required VoidCallback onTap,
  }) {
    final bool active = _activeTab == index;
    return InkWell(
      onTap: () {
        setState(() => _activeTab = active ? -1 : index);
        onTap();
      },
      borderRadius: BorderRadius.circular(6),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon,
                size: 20,
                color: active ? Colors.black87 : Colors.black45),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                color: active ? Colors.black87 : Colors.black45,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Action Buttons ────────────────────────────────────────────────────────────

  Widget _buildActions() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: _onDone,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Done',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: OutlinedButton(
              onPressed: () => Navigator.pop(context, null),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black87,
                padding: const EdgeInsets.symmetric(vertical: 14),
                side: const BorderSide(color: Color(0xFFDDDDDD)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Cancel',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Option Popups ─────────────────────────────────────────────────────────────

  void _showSizeOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => StatefulBuilder(
        builder: (ctx, setLocal) => Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Stroke Size',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
              const SizedBox(height: 16),
              Slider(
                value: _strokeSize,
                min: 1,
                max: 10,
                divisions: 9,
                label: _strokeSize.toStringAsFixed(1),
                activeColor: Colors.black,
                onChanged: (v) {
                  setLocal(() {});
                  setState(() => _strokeSize = v);
                },
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  void _showColorOptions() {
    final colors = [
      Colors.black,
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.purple,
      Colors.orange,
    ];
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Stroke Color',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              children: colors.map((c) {
                final selected = _strokeColor == c;
                return GestureDetector(
                  onTap: () {
                    setState(() => _strokeColor = c);
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: c,
                      shape: BoxShape.circle,
                      border: selected
                          ? Border.all(color: Colors.grey, width: 3)
                          : null,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  void _showBackgroundOptions() {
    final colors = [
      Colors.white,
      const Color(0xFFF5F5F5),
      const Color(0xFFFFF9C4),
      const Color(0xFFE8F5E9),
      const Color(0xFFE3F2FD),
    ];
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Background Color',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              children: colors.map((c) {
                final selected = _backgroundColor == c;
                return GestureDetector(
                  onTap: () {
                    setState(() => _backgroundColor = c);
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: c,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: selected ? Colors.grey : Colors.black12,
                        width: selected ? 3 : 1,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  // ── Done handler ──────────────────────────────────────────────────────────────

  Future<void> _onDone() async {
    final image = await _signatureKey.currentState?.toImage(pixelRatio: 3.0);
    if (mounted) Navigator.pop(context, image);
  }
}


// ─────────────────────────────────────────────────────────────────────────────
// Example usage in your app
// ─────────────────────────────────────────────────────────────────────────────

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Signature Demo',
      theme: ThemeData(useMaterial3: true),
      home: const ExampleHome(),
    );
  }
}

class ExampleHome extends StatefulWidget {
  const ExampleHome({super.key});

  @override
  State<ExampleHome> createState() => _ExampleHomeState();
}

class _ExampleHomeState extends State<ExampleHome> {
  ui.Image? _signature;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Onboarding')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_signature != null)
              RawImage(image: _signature, width: 200, height: 80),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final img = await ESignatureDialog.show(context);
                if (img != null) setState(() => _signature = img);
              },
              child: const Text('Open Signature Dialog'),
            ),
          ],
        ),
      ),
    );
  }
}